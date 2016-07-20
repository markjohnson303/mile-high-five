class MH5 < Sinatra::Base

  # General route actions
  get '/' do
  	@event = Event.all.sort_by &:position
    erb :home
  end

  get '/about' do
    erb :about
  end

end

