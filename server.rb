ENV['RACK_ENV'] ||= 'development'

require 'dotenv'
Dotenv.load unless ENV['RACK_ENV'] == 'production'

require 'sinatra/base'
require 'sinatra/flash'

require './config/datamapper'
require './app/app'
