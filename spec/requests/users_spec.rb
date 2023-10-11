require 'rails_helper'

RSpec.describe 'Controllers', type: :request do
  describe 'GET /users' do
    it 'returns http success and renders the index template' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('This page contains a list of Users')
    end
  end

  describe 'GET /show' do
    it 'returns http success and renders the show template' do
      get '/users/1'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('More details of a specific user')
    end
  end
end
