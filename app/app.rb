class URLShortener < Sinatra::Base
  register Sinatra::Flash
  use Rack::Session::Cookie, :key => 'rack.session',
                             :path => '/',
                             :secret => ENV['SESSION_SECRET']

  get '/' do
    @short_url = session.delete(:short_url)
    haml :index
  end

  get '/stats/:short_url' do
    @short_url = params[:short_url]
    @url = URL.get(decode_url(params[:short_url]))
    haml :stats
  end

  post '/short-url' do
  	url = URL.first_or_create(url: format_url(params[:long_url]))
    if url.save
      session['short_url'] = encode_url(url.id)
    else
      flash.next[:errors] = url.errors.full_messages
    end
  	redirect '/'
  end

  get '/:short_url' do
  	url = URL.get(decode_url(params[:short_url]))
  	if url
      visits = url.visits + 1
      url.update(:visits => visits)
      redirect url.url
    end
    redirect '/'
  end

  helpers do
    def format_url url
      url.downcase!
      url.strip!
      url.prepend('http://') unless url.start_with? 'http'
      url.chop! if url.end_with? '/'
      return url
    end

    def encode_url id
      id.to_s(36)
    end

    def decode_url url
      url.to_i(36)
    end
  end

end
