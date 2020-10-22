class User < ApplicationRecord
  has_many :favorites, :dependent => :delete_all
  has_many :bucket_lists, :dependent => :delete_all
  has_many :completed_trails, :dependent => :delete_all

  validates :username, presence: true, uniqueness: {case_sensitive: false, message: "already exists"}
  validates :name, presence: true
  has_secure_password
end
