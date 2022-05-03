class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
 
  def last_three_posts 
    Post.where('author_id = ?',self.id).last(3)
  end
end
