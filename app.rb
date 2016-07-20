class MH5 < Sinatra::Base

  # General route actions
  get '/' do
  	@weeknumber = Time.now.strftime('%W')
  	@event = Event.where(week: @weeknumber).sort_by &:position
    erb :home
  end

  get '/about' do
    erb :about
  end

end

