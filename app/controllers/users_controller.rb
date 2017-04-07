class UsersController < ApplicationController

  get '/users/' do
    if logged_in?
      @user = current_user
      erb :'/users/index'
    else
      redirect '/login'
    end
  end

  get '/signup' do
    if logged_in?
      redirect '/users/'
    else
      erb :'/users/signup'
    end
  end

  post '/signup' do
    @user = User.new(email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      erb :'/users/index'
    else
      redirect '/login'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/users/'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/users/'
    else
      redirect '/signup'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/'
    end
  end
end
