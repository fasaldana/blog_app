class User < ApplicationRecord
  has_many :Comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :Likes, class_name: 'Like', foreign_key: 'author_id'
  has_many :Posts, class_name: 'Post', foreign_key: 'author_id'

  def three_most_recent_posts
    self.Posts.order(created_at: :desc).limit(3)
  end
end
