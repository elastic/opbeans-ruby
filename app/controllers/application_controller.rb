class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, except: %i[rum_config]

  INDEX_FILE = Rails.root.join('frontend', 'build', 'index.html')

  def index
    respond_to do |format|
      format.html { render file: INDEX_FILE, layout: false }
    end
  end

  def rum_config
    render(
      plain: "window.elasticApmJsBaseServerUrl = '#{ENV['ELASTIC_APM_JS_SERVER_URL']}'",
      content_type: 'text/javascript'
    )
  end
end
