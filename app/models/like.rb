class Like < ActiveRecord::Base
  belongs_to :post
  validates :name, uniqueness: { scope: :post_id }
end
