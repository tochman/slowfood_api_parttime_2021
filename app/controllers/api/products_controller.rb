class Api::ProductsController < ApplicationController
  def index
    products = Product.all
    if products.any?
      render json: { products: products }, status: 200
    else
      render json: { message: 'There are no products in the database.' }, status: 422
    end
  end
end

