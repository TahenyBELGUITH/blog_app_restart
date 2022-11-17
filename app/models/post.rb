class Post < ApplicationRecord
 has_many  :likes
 has_many :comments
 belongs_to :author , class_name: "User"

  validates :title, presence :true
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }



 def update_posts_counter
  author.increment!(:posts_counter)
 end

 def five_last_comments 
  # Comment.last(5)
  comments.order(created_at: :DESC).limit(5)
 end

end
