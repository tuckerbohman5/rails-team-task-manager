class User < ActiveRecord::Base
  has_secure_password 
  # before_save :social_login?
  has_many :tasks
  has_many :projects, :through => :tasks
  has_many :comments
  
  validates_presence_of :name, :email
  validates :email, uniqueness: true, length: { minimum: 10}

  # def social_login?
    
  #   if uid
  #     password = "f@c3b00k"
  #   end
  # end

end
