require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), '..', 'twilio_endpoint.rb')

Dir['./spec/support/**/*.rb'].each &method(:require)

Sinatra::Base.environment = 'test'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr_cassettes'
  c.hook_into :webmock
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

ENDPOINT_KEY = ENV['ENDPOINT_KEY'] = '123'
