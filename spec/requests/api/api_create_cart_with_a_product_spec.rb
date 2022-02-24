RSpec.describe 'POST /api/carts', type: :request do
  let!(:product) { create(:product) }

  subject { response }

  before do
    post '/api/carts',
         params: { cart: { product_id: product.id } }

    @cart = Cart.last
  end

  it { is_expected.to have_http_status 201 }

  it 'is expected to save cart to database' do
    expect(@cart).to_not eq nil
  end

  it 'is expected to add a product to the cart' do
    expect(@cart.products).to include product
  end

  it 'is expected to return a message that the product was added to the order' do
    expect(response_json['message'])
      .to eq "#{product.name} has been added to your order"
  end

  describe 'unsuccessful request with invalid product id' do
    before do
      post '/api/carts',
           params: {
             cart: { product_id: '' }
           }
    end

    it 'is expected to return a "not found" message' do
      expect(response_json['message'])
        .to eq "We couldn't find the product you tried to add."
    end
  end
end
