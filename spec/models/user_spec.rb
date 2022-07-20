require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create!(name: 'Aaron', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', posts_counter: 0) }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'check if recent posts returns 3 posts even if there are more posts to gather' do
    Post.create!(title: 'Post 1', text: 'Content 1', author: subject)
    Post.create!(title: 'Post 2', text: 'Content 2', author: subject)
    Post.create!(title: 'Post 3', text: 'Content 3', author: subject)
    expect(subject.three_most_recent_posts.size).to eq(3)
  end

  # describe 'relationships' do
  #   it { should have_many(:comments) }
  #   it { should have_many(:likes) }
  #   it { should have_many(:posts) }
  # end
end
