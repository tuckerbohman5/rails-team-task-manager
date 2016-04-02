class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :comments
  has_many :users, through: :comments

  validates_presence_of :name, :description

  #accepts_nested_attributes_for :tasks

  def tasks_attributes=(tasks_attributes)
    tasks_attributes.values.each do |task_details|
     
      if !task_details["description"] == ""
        self.tasks.find_or_create_by(task_details)
      end
    end
  end

  def self.completed_projects
    where(completed: true)
  end

  def self.incomplete_projects
    where(completed: false)
  end

  def completed_tasks
    tasks.where(completed: true)
  end

  def incomplete_tasks
    tasks.where(completed: false)
  end

end
