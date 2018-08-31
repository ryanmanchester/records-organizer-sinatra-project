class RecordsController < ApplicationController

  get '/records/new' do
    erb :'records/new'
  end

  get '/records' do
    @records = Record.all
    erb :'/records/index'
  end

  get '/records/:id' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      @record = Record.find_by(id: params["id"])
      
      erb :'/records/show'
    else
      redirect '/'
    end
  end

  get '/records/:id/edit' do
    if logged_in?
      @record = Record.find_by(user_id: session[:user_id])
      erb :'/records/edit'
    else
      redirect '/'
    end
  end

  post '/records' do
    @record = Record.create(artist: params["artist"], name: params["name"], user_id: session[:user_id])
    @user = User.find_by(id: session[:user_id])
    redirect "/users/#{@user.id}"
  end

  patch '/records/:id' do
    @user = User.find_by(id: session[:user_id])
    @record = Record.find_by(id: params["id"])
    @record.update(name: params["name"], artist: params["artist"])
    redirect "/users/#{@user.id}"
  end

  delete '/records/:id/delete' do
    @user = User.find_by(id: session[:user_id])
    @record = Record.find_by(id: params["id"])
    @record.destroy
    redirect "/users/#{@user.id}"
  end
end
