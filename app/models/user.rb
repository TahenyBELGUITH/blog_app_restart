class User < ApplicationRecord
 has_many :posts, foreign_key: "author_id"
 has_many  :likes, foreign_key: "author_id"
 has_many :comments, foreign_key: "author_id"


 validates :name, presence :true
 validates :posts_counter, numericality: { greater_than_or_equal_to: 0 }

 def three_recent_posts 
  # Post.last(3)
  posts.order(created_at: :DESC).limit(3)
 end
 
end
