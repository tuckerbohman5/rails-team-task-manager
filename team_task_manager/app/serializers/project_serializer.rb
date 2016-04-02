class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date, :comments
end
