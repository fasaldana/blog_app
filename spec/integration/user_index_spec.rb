require 'rails_helper'

RSpec.describe User, type: :system do
  user = User.all.map(&:name)
  describe 'User index' do
    it 'should show all users' do
      visit users_path
      expect(page.body).to include(*user)
    end

    it 'should show user profile picture' do
      visit users_path
      expect(page.body).to include('https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'can see number of posts each user has' do
      visit users_path
      expect(page.body).to include('number of posts')
    end

    it 'checks navigation from clicking link to user profile' do
      visit users_path
      click_link('George')
      expect(current_path).to eq '/users/3'
    end
  end
end
