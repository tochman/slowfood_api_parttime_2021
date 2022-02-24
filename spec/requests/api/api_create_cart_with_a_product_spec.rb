RSpec.describe "POST /api/carts", type: :request do
  let!(:product) { create(:product) }
  subject { response }
  before do
    post "/api/carts",
         params: { cart: { product_id: product.id } }
  end

  it { is_expected.to have_http_status :created }
  it "is expected to save cart to database" do
    expect(Cart.all).to_not eq nil
  end

  it "is expected to return a message that the product was added to the order" do
    expect(response_json["message"]).to eq "#{product.name} has been added to your order"
  end

  describe "unsuccessful request with invalid product id" do
    before do
      post "/api/carts",
           params: {
             cart: { product_id: '' }
           }
    end

    it 'is expected to return nil result' do
        expect(response.body['results'].nil?).to eq true
       end

    
  end
end
