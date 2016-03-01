class AddUserIdToPost < ActiveRecord::Migration
  def up
    add_column :posts, :user_id, :integer
    
    Post.find_each do |post|
      user = User.find_by(name: post.author)
      post.update_column(user_id: user.id) if user
    end
  end
  
  def down
    remove_column :posts, :user_id
  end
end
