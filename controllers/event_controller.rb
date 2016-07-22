class MH5 < Sinatra::Base

  # RESTful Artist Controller Actions
  # index
  get '/events' do
    @event = Event.all
    erb(:"events/index")
  end

  # create
  post '/events' do
    request.body.rewind
    request_body = request.body.read
    parsed = JSON.parse(request_body)
    Event.create(parsed)
  end

  # show
  get '/events/:id' do
    @event = Event.find(params[:id])
    erb(:"events/show")
  end

  

end
