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
    @url = URL.get(params[:short_url].to_i(36))
    @short_url = params[:short_url]
    haml :stats
  end

  post '/short-url' do
  	url = URL.first_or_create(url: params[:long_url])
    if url.save
      session['short_url'] = url.id.to_s(36)
    else
      flash.next[:errors] = url.errors.full_messages
    end
  	redirect '/'
  end

  get '/:short_url' do
  	url = URL.get(params[:short_url].to_i(36))
  	if url
      visits = url.visits + 1
      url.update(:visits => visits)
      redirect url.url
    end
    redirect '/'
  end

end
