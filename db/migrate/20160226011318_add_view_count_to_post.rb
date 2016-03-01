class AddViewCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :view_count, :integer, default: 0
    
    Post.find_each do |post|
      random_count = (rand * 100).round
      post.update_column(:view_count, random_count)
    end
  end
  
  def down
    remove_column :posts, :view_count      
  end
end
