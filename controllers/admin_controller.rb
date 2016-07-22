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


  # edit
  get '/admin/event/:id/edit' do
    @event = Event.find(params[:id])
    erb(:"admin/edit")
  end


  # update
  post '/admin/event/:id' do
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect("/admin")
    else
      erb(:"admin")
    end
  end

  # delete
  delete '/event/:id/delete' do
    @event = Event.find(params[:id])
    if @event.destroy
      redirect('/admin')
    else
      redirect("/admin")
    end
  end

end
