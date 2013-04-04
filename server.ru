module Rack
  class CommonLogger
    def call(env)
      @app.call(env)
    end
  end
end

run Proc.new {|env|
  start = Time.now
  sleep(rand(1000) / 1000.0)
  elapsed = (Time.now - start) * 1000
  reqid=env['HTTP_HEROKU_REQUEST_ID']
  $stdout.puts("request-id=#{reqid} measure.rack-request=#{elapsed.round}ms")
  [200, {'Content-Type' => 'text/plain'}, ["hello world"]]
}
