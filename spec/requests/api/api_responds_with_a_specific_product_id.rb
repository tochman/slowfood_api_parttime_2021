RSpec.describe 'GET /api/products/:id' do
  describe 'successfully' do
    let!(:product) {create(:product, name: 'chicken wings', price: '200 kr')}

    before do
      get "/api/products/#{product.id}"
    end

    it 'is expected to return a 200 status' do
      expect(response).to have_http_status 200
    end
    it 'is expected to return the requested products name' do
      expect(JSON.parse(response.body)['product']['name']).to eq 'chicken wings'
    end
    it 'is expected to return the requested products price' do
      expect(JSON.parse(response.body)['product']['price']).to eq '200 kr'
    end
  end 
end