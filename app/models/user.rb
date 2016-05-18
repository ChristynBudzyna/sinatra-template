class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence:true
  validates :password, presence:true

  # has_many :somethings
  # has_many :other_things, through: somethings
end
