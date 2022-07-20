require 'rails_helper'

RSpec.describe 'Post index', type: :system do
    user = User.create!(name: 'Test1', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico', posts_counter: 0)
    post = Post.create(author: user, title: "some title 1", text: "some text 1")
    comment = Comment.create!(author: user, post: post, text: 'This is a comment')

    it 'can see the current user name' do
        visit user_post_path(user, post)
        expect(page.body).to include(user.name)
    end

    it 'can see Number of posts' do
        visit user_posts_path(user)
        expect(page.body).to include('number of posts: 4')
    end

    it 'can see post title' do
        visit user_posts_path(user)
        expect(page.body).to include(post.title)
    end

    it 'can see post text' do
        visit user_posts_path(user)
        expect(page.body).to include(post.text)
    end

    it 'can see the first comment' do
        visit user_posts_path(user)
        expect(page.body).to include(comment.text)
    end

    it 'can see the number of likes' do
        visit user_posts_path(user)
        expect(page.body).to include('0 likes')
    end

    it 'when I click on a post link, I am taken to the post show page' do
        visit user_posts_path(user)
        click_link(post.title)
        expect(current_path).to eq(user_post_path(user, post))
    end
end

