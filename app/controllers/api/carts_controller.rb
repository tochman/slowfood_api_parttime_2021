class Api::CartsController < ApplicationController
  def create
    product = Product.find(params[:cart][:product_id])
    cart = Cart.create
    cart.products << product

    render json: { message: "#{cart.products.last.name} has been added to your order" }, status: 201
  end
end
