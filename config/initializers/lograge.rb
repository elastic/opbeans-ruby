Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.custom_options = lambda do |event|
    ElasticAPM.log_ids do |transaction_id, span_id, trace_id|
      { :'pid' => Process.pid,
        :'timestamp' => Time.now.utc,
        :'transaction.id' => transaction_id,
        :'span.id' => span_id,
        :'trace.id' => trace_id }
    end
  end
end
