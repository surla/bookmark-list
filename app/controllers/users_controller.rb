class UsersController < ApplicationController

  get '/users/index' do
    erb :'/users/index'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.new(email: params[:email], password: params[:password])
    @user.save
    erb :'/users/index'
  end

  get '/login' do
    erb :'/users/login'
  end
end
