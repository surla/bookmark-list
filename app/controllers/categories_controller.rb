class CategoriesController < ApplicationController

  get '/categories' do
    @categories = Category.all
    @user = current_user
    erb :'/categories/index'
  end

  get '/categories/:id' do
    @user = current_user
    @category = Category.find_by_id(params[:id])
    erb :'/categories/show'
  end
end
