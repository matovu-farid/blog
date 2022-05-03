class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def update_post_likes_counter(value)
    post = Post.where('id = ?', post_id).first
    post.likes_counter = value
    post.save
  end
end
