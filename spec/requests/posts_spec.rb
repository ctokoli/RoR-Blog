RSpec.describe 'Controllers', type: :request do
  describe 'GET /users/posts' do
    it 'returns http success and renders the index template' do
      get '/users/1/posts'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Harry')
    end
  end

  describe 'GET /show' do
    it 'returns http success and renders the show template' do
      get '//users/297/posts/182'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('Harry')
    end
  end
end
