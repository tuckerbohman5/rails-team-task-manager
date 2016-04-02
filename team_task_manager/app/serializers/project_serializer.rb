class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :due_date
end
