ENV['RACK_ENV'] ||= 'development'

unless ENV['RACK_ENV'] == 'production'
	require 'dotenv'
	Dotenv.load
end

require 'sinatra/base'
require 'sinatra/flash'

require './config/datamapper'
require './app/app'
