# frozen_string_literal: true

require 'rack'

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)
    return [403, {}, ['Access denied']] if request.path.start_with?('/admin')

    @app.call(env)
    # END
  end
end
