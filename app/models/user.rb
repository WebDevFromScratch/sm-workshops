class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :playlists

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end