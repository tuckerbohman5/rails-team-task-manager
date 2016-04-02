class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date
  has_many :comments, serialier: ProjectCommentSerializer
end
