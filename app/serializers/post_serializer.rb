class PostSerializer < ActiveModel::Serializer
  attributes :title, :content, :view_count, :lead
  has_many :comments, :likes
  has_one :user
end