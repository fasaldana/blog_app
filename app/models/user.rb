class User < ApplicationRecord
  has_many :Comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :Likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :Posts, class_name: 'Post', foreign_key: 'author_id'

  validates :username, presence: true, uniqueness: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
