class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_post_count
    update(posts_counter: posts_counter + 1)
  end

  def five_most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
