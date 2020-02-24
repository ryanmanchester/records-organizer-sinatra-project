class RecordsController < ApplicationController
  get '/records/new' do
    if logged_in?
    erb :'records/new'
  else
    flash[:message] = "You must sign up or log in to add a record to your collection"
    redirect '/records'
  end
  end

  get '/records' do
    @records = Record.all
    erb :'/records/index'
  end

  get '/records/:id' do
    @record = Record.find_by(id: params["id"])

    if logged_in? && @record.user_id == @user.id
      @user = User.find_by(id: session[:user_id])

      erb :'/records/show'
    else

      flash[:message] = "Please log in or sign up"
      redirect '/records'
    end
  end

  get '/records/:id/edit' do
      @record = Record.find_by(id: params["id"])
    if logged_in? && @record.user_id == @user.id

      erb :'/records/edit'
    else
      flash[:message] = "You must be logged in to edit your record collection"
      redirect '/records'
    end
  end

  post '/records' do
    if !params["artist"].empty? && !params["name"].empty?
      @user = User.find_by(id: session[:user_id])
      @record = Record.find_or_create_by(artist: params["artist"], name: params["name"], user_id: session[:user_id])

      flash[:message] = "Successfully created your new record!"
      redirect "/users/#{@user.id}"
    else
      flash[:message] = "Artist and Album Name are both required fields"
      redirect '/records/new'
    end
  end

  patch '/records/:id' do
    @user = User.find_by(id: session[:user_id])
    @record = Record.find_by(id: params["id"])

    if logged_in? && @record.user_id == @user.id
    @record.update(name: params["name"], artist: params["artist"])

    flash[:message] = "Record sucessfully updated"
    redirect "/users/#{@user.id}"
   else
    flash[:message] = "You must own a record to make changes"
    redirect "/users/#{@user.id}"
   end
  end

  delete '/records/:id/delete' do
    @user = User.find_by(id: session[:user_id])
    @record = Record.find_by(id: params["id"])
    if logged_in? && @record.user_id == @user.id
    @record.destroy

    flash[:message] = "Record sucessfully deleted"
    redirect "/users/#{@user.id}"
  else
    flash[:message] = "You must own a record to delete it."
    redirect "/users/#{@user.id}"
  end
end

end
