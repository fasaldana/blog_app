class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after-save :update_like_count

  private

  def update_like_count
    post.update(likes_counter: post.likes.count)
  end
end
