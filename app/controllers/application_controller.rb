class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: %i[rum_config]

  INDEX_FILE =
    File.read(Rails.root.join('frontend', 'build', 'index.html'))

  def index
    respond_to do |format|
      format.html do
        render plain: inject_rum_config(INDEX_FILE)
      end
    end
  end

  private

  def inject_rum_config(html)
    html
      .gsub(
        '<head>',
        "<head><script>window.rumConfig = #{rum_config.to_json}</script>"
      ).gsub(
        '<script type="text/javascript" src="/rum-config.js"></script>',
        ''
      )
  end

  def rum_config
    {
      serviceName: ENV['RUM_SERVICE_NAME'],
      serviceVersion: ENV['RUM_SERVICE_VERSION'],
      serverUrl: ENV['RUM_SERVER_URL'],
      pageLoadTraceId: ElasticAPM.current_transaction&.trace_id,
      pageLoadSpanId: ElasticAPM.current_transaction&.ensure_parent_id,
      pageLoadSampled: ElasticAPM.current_transaction&.sampled?
    }
  end
end
