class Api::CartsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    @cart = cart.create(product_id: product.id)
    render json: { message: "#{product.name} has been added to your order" }, status: 200
  end
end