ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/datamapper'
require './app/app'