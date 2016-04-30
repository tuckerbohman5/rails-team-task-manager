class ProjectCommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user, serialier: CommentUserSerializer
end
