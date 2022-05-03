class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  def update_post_comment_counter(value)
    post = Post.where('id = ?', post_id).first
    post.comments_counter = value
    post.save
  end
end
