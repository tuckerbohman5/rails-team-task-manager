class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :content, presence: true, length: {minimum: 5}
end
