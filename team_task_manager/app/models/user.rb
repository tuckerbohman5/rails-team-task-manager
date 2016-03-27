class User < ActiveRecord::Base
  before_save :social_login?
  #has_secure_password 
  has_many :tasks
  has_many :projects, :through => :tasks
  has_many :comments
  
  validates_presence_of :name, :email
  validates :email, uniqueness: true, length: { minimum: 10}

  def social_login?
    if self.uid.nil?
      has_secure_password
    end
  end
end
