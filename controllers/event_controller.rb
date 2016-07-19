class MH5 < Sinatra::Base

  # RESTful Artist Controller Actions
  # index
  get '/events' do
    @event = Event.all
    erb(:"events/index")
  end

  # new
  get '/artists/new' do
    @artist = Artist.new
    erb(:"artists/new")
  end

  # create
  post '/events' do
    request.body.rewind
    request_body = request.body.read
    parsed = JSON.parse(request_body)
    Event.create(parsed)
  end

  # show
  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb(:"artists/show")
  end

  # edit
  get '/artists/:id/edit' do
    @artist = Artist.find(params[:id])
    erb(:"artists/edit")
  end

  # update
  put '/artists/:id' do
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect("/artists/#{artist.id}")
    else
      erb(:"artists/edit")
    end
  end

  # delete
  delete '/artists/:id/delete' do
    @artist = Artist.find(params[:id])
    if @artist.destroy
      redirect('/artists')
    else
      redirect("/artists/#{@artist.id}")
    end
  end

end
