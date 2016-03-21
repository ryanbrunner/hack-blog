json.array!(@posts) do |post|
  json.extract! post, :title, :content, :view_count
  json.url post_url(post, format: :json)
  if post.user
    json.author do
      json.extract! post.user, :id, :email
    end
  end
  json.comments do
    json.array!(post.comments) do |comment|
      json.extract! comment, :id, :content
    end
  end
  json.likes do
    json.array!(post.likes) do |like|
      json.extract! like, :id, :name
    end
  end
end