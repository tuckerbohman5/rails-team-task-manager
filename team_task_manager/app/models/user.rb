class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks
  has_many :projects, :through => :tasks
  has_many :comments
  
  validates_presence_of :name, :email, :password
  validates :email, uniqueness: true, length: { minimum: 10}
end
