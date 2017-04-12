class User < ActiveRecord::Base
  has_secure_password

  has_many :bookmarks
  has_many :categories, through: :bookmarks

  validates_presence_of :email, :password_digest
end
