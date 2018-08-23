class RecordsController < ApplicationController

  get '/records/new' do
    erb :'records/new'
  end

  get '/records/:id' do
    @record = Record.find_by(user_id: session[:user_id])
    erb :'/records/show'
  end

  get '/records/:id/edit' do
    @record = Record.find_by(user_id: session[:user_id])
    erb :'/records/edit'
  end

  post '/records' do
  @record = Record.create(artist: params["artist"], name: params["name"], user_id: session[:user_id])
  @user = User.find_by(id: session[:user_id])
  redirect "users/#{@user.id}"
  end

  patch '/records/:id' do
  @record = Record.find_by(id: params["id"])
  @record.update(name: params["name"], artist: params["artist"])
  end
end
