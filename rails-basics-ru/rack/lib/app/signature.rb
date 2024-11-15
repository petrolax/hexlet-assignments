# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, header, response = @app.call(env)
    response << "\n#{Digest::SHA256.hexdigest response[0]}"
    [status, header, response]
    # END
  end
end
