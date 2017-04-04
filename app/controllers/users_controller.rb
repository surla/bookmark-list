class UsersController < ApplicationController

  get '/users/index' do
    erb :'/users/index'
  end

  get '/signup' do
    erb :'/users/signup'
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
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/users/index'
    else
      redirect '/signup'
    end
  end
end
