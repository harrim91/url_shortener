class URLShortener < Sinatra::Base
  get '/' do
    haml :index
  end
end
