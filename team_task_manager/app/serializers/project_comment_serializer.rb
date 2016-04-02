class ProjectCommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :user_id, serialier: CommentUserSerializer
end
