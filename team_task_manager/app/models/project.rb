class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  has_many :comments

  has_many :commentors, through: :comments,  :class_name => "User", :foreign_key => :user_id
  has_many :collaborators, through: :tasks,  :class_name => "User", :foreign_key => :user_id

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
    # a project is considered complete when all of it's tasks are complete
    # Merge scope
    # tasks.merge(Task.completed)
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
