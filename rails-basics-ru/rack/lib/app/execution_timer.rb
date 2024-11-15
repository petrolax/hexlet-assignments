# frozen_string_literal: true

require 'rack'
require 'time'

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start = Time.now
    res = @app.call(env)
    puts "#{((Time.now - start).to_f * 1000 * 1000).to_i} microseconds"
    res
    # END
  end
end
