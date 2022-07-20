require 'rails_helper'

RSpec.describe Comment, type: :model do
  user = User.create!(name: 'Aaron', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico',
                      posts_counter: 0)
  post = Post.create!(title: 'Post 1', text: 'Content 1', author: user, comments_counter: 0, likes_counter: 0)
  subject { Comment.create!(text: 'Comment 1', author: user, post: post) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a post' do
    subject.post = nil
    expect(subject).to_not be_valid
  end
end
