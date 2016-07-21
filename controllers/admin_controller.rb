class MH5 < Sinatra::Base

  # RESTful Artist Controller Actions
  # index
  get '/admin' do
    @weeknumber = Time.now.strftime('%W')
    @event = Event.all
    @eventweeks = Event.select( "DISTINCT week").map(&:week)
    erb(:"admin/index")
  end

  # create
  post '/admin' do
    @event = Event.new(params[:event])
    if @event.save
      redirect("/admin")
    else
      p "submission error"
    end
  end

  # show
  get '/events/:id' do
    @event = Event.find(params[:id])
    erb(:"events/show")
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
