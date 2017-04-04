class BookmarksController < ApplicationController

  get '/bookmarks/new' do
    erb :'/bookmarks/new'
  end
end
