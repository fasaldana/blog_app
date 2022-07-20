require 'rails_helper'

RSpec.describe 'User show', type: :system do
    user = User.first
    (1..3).each { |a| Post.create(author: user, title: "some title #{a + 1}", text: "some text #{a + 1}") }

    it 'can see the user profile picture' do
        visit user_path(user.id)
        expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'can see the user name' do
        visit user_path(user.id)
        expect(page.body).to include(user.name)
    end

    it 'can see the user bio' do
        visit user_path(user.id)
        expect(page.body).to include(user.bio)
    end

    it 'can see the user number of posts' do
        visit user_path(user.id)
        expect(page.body).to include('number of posts')
    end

    it 'can see 3 most recent posts' do
        posts = user.three_most_recent_posts.map(&:text)
        visit user_path(user.id)
        expect(page.body).to include(*posts)
    end

    it 'Checks if the see all posts button appears' do
        visit user_path(user.id)
        expect(page.body).to include('See all posts')
    end

    it 'Checks if the see all posts button redirects to the user posts page' do
        visit user_path(user.id)
        click_button('See all posts')
        expect(current_path).to eq "/users/1/posts"
    end
end