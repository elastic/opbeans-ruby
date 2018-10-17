require 'http'

class OpbeansShuffle
  def initialize(app, test, services:, probability:)
    @app = app
    @test = Regexp.new(test)
    @services = services.split(',')
    @probability = Float(probability)
  end

  def call(env)
    path = env['PATH_INFO']

    if @test =~ path && rand < @probability && @services.any?
      lucky_winner = @services.sample
      Rails.logger.info "Proxying #{path} to #{lucky_winner}"

      unless lucky_winner.start_with?('http://')
        lucky_winner = "http://#{lucky_winner}:3000"
      end

      resp = HTTP.get("#{lucky_winner}#{path}")

      [
        resp.status,
        { 'Content-Type' => resp.headers['Content-Type'] || 'text/plain' },
        resp.body
      ]
    else
      @app.call(env)
    end
  end
end

