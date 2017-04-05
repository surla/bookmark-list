class BookmarksController < ApplicationController

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'/bookmarks/index'
  end

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end

  post '/bookmarks/new' do
    @bookmark = Bookmark.new(url: params[:url], title: params[:title], description: params[:description])
    @bookmark.save
    redirect '/bookmarks'
  end

  get '/bookmarks/:id' do
    @bookmark = Bookmark.find_by_id(params[:id])
    erb :'/bookmarks/show'
  end

end
