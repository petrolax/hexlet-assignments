# frozen_string_literal: true

require 'uri'
require 'forwardable'

# BEGIN
class Url
  attr_accessor :url

  extend Forwardable
  def initialize(str)
    @url = URI(str)
    @qparams = {}
  end
  def_delegators :@url, :scheme, :host, :port

  def query_params
    @qparams = url.query.nil? ? {} : URI.decode_www_form(url.query).to_h.transform_keys(&:to_sym)
    @qparams
  end

  def query_param(key, val = nil)
    query_params if @qparams.nil? || @qparams.empty?
    res = @qparams[key]
    return val if res.nil?
    res
  end

  include Comparable
  def ==(other)
    return false  if scheme != other.scheme

    return false  if host != other.host

    return false  if port != other.port

    return false if query_params.length != other.query_params.length

    query_params.reduce(true) do |res, (k,v)|
      res ||= true
      val = other.query_param(k)
      break false if val.nil?
      break false if v != val
      res
    end
  end
end

# u = Url.new 'https://google.com?key=value&key2=value'
# puts u.scheme
# puts u.host
# puts u.port

# # puts u.query_params
# # puts u.query_params == {key: 'value'}

# puts u.query_param(:val).nil?
# puts u.query_param(:new, 'ehu') == 'ehu'

# ur = Url.new 'https://google.com?key2=value&key=valu'

# puts u == ur

# END
