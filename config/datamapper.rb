require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/url_shortener_#{ENV['RACK_ENV']}")
DataMapper.finalize