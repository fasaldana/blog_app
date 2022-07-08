require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:body) }
  end

  describe 'relationships' do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe 'comment Model Properties' do
    it 'should have a body attribute' do
      expect(Comment.new).to respond_to(:body)
    end
  end
end
