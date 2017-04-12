class Bookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates_presence_of :url, :title, :description
end
