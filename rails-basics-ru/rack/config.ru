# frozen_string_literal: true

require_relative 'lib/app'

Rack::Handler::WEBrick.run App.init, Port: 3000, Host: '0.0.0.0'
