class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  def update_like_count
    post.update(likes_counter: post.likes_counter + 1)
  end
end
