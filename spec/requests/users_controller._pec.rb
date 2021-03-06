require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'renders the correct text on template' do
      expect(response.body).to include('User index page')
    end
  end

  describe 'GET #show' do
    before(:each) { get user_path(1) }

    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template('show')
    end

    it 'renders the correct text on template' do
      expect(response.body).to include('User show page')
    end
  end
end
