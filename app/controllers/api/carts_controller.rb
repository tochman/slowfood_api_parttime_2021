class Api::CartsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :product_not_found
  def create
    binding.pry
    product = Product.find(params[:cart][:product_id])
    cart = Cart.create
    cart.products << product

    render json: { message: "#{cart.products.last.name} has been added to your order" }, status: 201
  end

  private 

  def product_not_found
    render json: { message: "We couldn't find the product you tried to add."}
  end
end
