class Comment < ApplicationRecord
  belongs_to :post, counter_cache: :comments_counter
  belongs_to :author, class_name: 'User'
  def update_post_comment_counter
    post.increment!(:comments_counter)
  end
end
