class BookmarksController < ApplicationController

  get '/bookmarks' do
    if logged_in?
      @bookmarks = Bookmark.all
      current_user
      erb :'/bookmarks/index'
    else
      redirect '/login'
    end
  end

  get '/bookmarks/new' do
    if logged_in?
      current_user
      @bookmark = Bookmark.new
      @categories = Category.all
      erb :'/bookmarks/new'
    else
      redirect '/login'
    end
  end

  post '/bookmarks/new' do
    current_user
    @bookmark = Bookmark.new(url: params[:url], title: params[:title], description: params[:description])
    @bookmark.user = current_user
    @bookmark.category = Category.find_or_create_by(name: params[:category])

    if @bookmark.save
      erb :'/bookmarks/show', locals: {message: "Successfully created bookmark."}
    else
      erb :'/bookmarks/new'
    end
  end

  get '/bookmarks/:id' do
    if logged_in?
      current_user
      @bookmark = Bookmark.find_by_id(params[:id])
      erb :'/bookmarks/show'
    else
      redirect '/login'
    end
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find_by_id(params[:id])
    @categories = Category.all
    if @bookmark.user.id == current_user.id

      erb :'/bookmarks/edit'
    else
      redirect :'/bookmarks'
    end
  end

  patch '/bookmarks/:id' do
    @bookmark = Bookmark.find_by_id(params[:id])
    @bookmark.update(url: params[:url], title: params[:title], description: params[:description])
    redirect "/bookmarks/#{@bookmark.id}"
  end

  delete '/bookmarks/:id/delete' do
    @bookmark = Bookmark.find_by_id(params[:id])
    if @bookmark.user.id == current_user.id
      @bookmark.delete
      redirect :'/users'
    else
      redirect :'/bookmarks'
    end
  end
end
