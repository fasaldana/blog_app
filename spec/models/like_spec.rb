require 'rails_helper'

RSpec.describe Like, type: :model do
  user = User.create!(name: 'George', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Super smart')
  post = Post.create!(author: user, title: 'Title', text: 'sweet text!')

  Like.create(author: user, post: post)

  it 'should increment post likes_counter' do
    counter = post.likes_counter
    expect(post.likes_counter).to eq(counter)
  end
end
