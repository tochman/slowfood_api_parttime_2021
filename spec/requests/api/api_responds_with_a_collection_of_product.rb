
RSpec.describe 'GET /api/products' do
  describe 'successfully' do
    let!(:products) {3.times { create(:product)}}
    before do
      get '/api/products'
    end

    it 'is expected to return a 200 response status' do
      expect(response).to have_http_status 200
    end
       
    it 'is expected to return all products' do
      expect(response_json['products'].count).to eq 3
    end

    it 'is expected to return products titles' do
      expect(JSON.parse(response.body)['products'].first['title']).to eq ''
    end
  end
end
