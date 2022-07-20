require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create!(name: 'Aaron', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                      posts_counter: 0)
  subject { Post.create!(title: 'Post 1', text: 'Content 1', author: user, comments_counter: 0, likes_counter: 0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'check if recent comments returns 5 posts even if there are more posts to gather' do
    Comment.create!(text: 'Comment 1', author: user, post: subject)
    Comment.create!(text: 'Comment 2', author: user, post: subject)
    Comment.create!(text: 'Comment 3', author: user, post: subject)
    Comment.create!(text: 'Comment 4', author: user, post: subject)
    Comment.create!(text: 'Comment 5', author: user, post: subject)
    expect(subject.five_most_recent_comments.size).to eq(5)
  end
end
