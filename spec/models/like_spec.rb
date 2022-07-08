require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:post_id) }
  end

  describe 'relationships' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe 'like Model Properties' do
    it 'should have a body attribute' do
      expect(Like.new).to respond_to(:body)
    end
  end
end
