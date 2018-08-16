class UsersController < ApplicationController

  get '/users/home' do
    if logged_in?
    @user = User.find_by(username: params["username"])
    @record = Record.find_by(user_id: session[:user_id])
    erb :'users/home'
  else
    redirect '/hompage'
  end
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if !params["username"].empty? && !params["email"].empty? && !params["password"].empty?
      @user = User.create(params)
      session[:user_id] = @user.id
      #binding.pry
      redirect 'users/home'
    else
      redirect '/signup'
    end
  end
end
