class UsersController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  get '/login' do
    erb :'users/login'
  end

  get '/users/home' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])
      @record = Record.find_by(user_id: session[:user_id])
      erb :'users/home'
  else
    redirect '/'
  end
end

get '/logout' do
  logout
  redirect '/'
end

post '/signup' do
  if !params["username"].empty? && !params["email"].empty? && !params["password"].empty?
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect 'users/home'
  else
    redirect '/signup'
    end
  end

  post '/login' do
    if !logged_in?
      @user = User.find_by(username: params["username"])
      session[:user_id] = @user.id
      redirect '/users/home'
    else
      redirect '/login'
    end
  end
end
