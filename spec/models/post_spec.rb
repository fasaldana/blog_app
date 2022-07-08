require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:body) }
  end

  describe 'relationships' do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe 'post Model Properties' do
    it 'should have a body attribute' do
      expect(Post.new).to respond_to(:body)
    end
  end
end
