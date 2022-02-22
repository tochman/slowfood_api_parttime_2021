class Api::CartsController < ApplicationController

  def create
    
    product = Product.find(params[:cart][:product_id])
     Cart.create
     binding.pry
    render json: { message: "#{product.name} has been added to your order" }, status: 200
  end
end