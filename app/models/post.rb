class Post < ApplicationRecord
  belongs_to :author,class_name: 'User'
  has_many :likes
  has_many :comments
  def update_posts_count(value)
   user = User.where('id = ?',self.author_id).first
   user.posts_counter = value
   user.save
  end
  def recent_comments 
   Comment.where('post_id = ?',self.id).last(5)
  end
end
