
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
      expect(JSON.parse(response.body)['products'].count).to eq 3
    end
     binding.pry
    it 'is expected to return products names' do
      expect(JSON.parse(response.body)['products'].first['name']).to eq 'chicken wings'
      binding.pry
    end
  end
end
