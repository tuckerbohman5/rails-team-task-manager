class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :description, presence: true, length: { minimum: 5 }
end
