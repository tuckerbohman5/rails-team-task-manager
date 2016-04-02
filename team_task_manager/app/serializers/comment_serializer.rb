class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :content

end
