class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments
  def update_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end
end
