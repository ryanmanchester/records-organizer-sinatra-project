class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "users/#{@user.id}"
    else
    erb :'users/signup'
  end
  end

  get '/login' do
    if logged_in?
      redirect "users/#{@user.id}"
    else
    
    erb :'users/login'
  end
  end

  get '/users/:id' do
    if logged_in?
      @user = User.find_by(id: session[:user_id])

      erb :'users/show'
  else
    redirect '/records'
  end
end

get '/logout' do
  logout
  flash[:message] = "Logged out. See you next time!"
  redirect '/records'
end

post '/signup' do
  @existing_user = User.find_by(username: params["username"])
  if !params["username"].empty? && !@existing_user && !params["email"].empty? && !params["password"].empty?
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "users/#{@user.id}"
    flash[:message] = "Successfully created your new account!"
  else
    redirect '/signup'
    end
  end

  post '/login' do
    @user = User.find_by(username: params["username"])

    if @user && @user.authenticate(params["password"])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    else
      redirect '/login'
    end
  end
end
