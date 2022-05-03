class Post < ApplicationRecord
  belongs_to :user, counter_cache: :posts_counter
  has_many :likes
  has_many :comments
end
