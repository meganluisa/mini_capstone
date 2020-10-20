class Api::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    @carted_products = CartedProduct.where(status: "carted")
    render "index.json.jb"
  end

  def create
    @carted_product = CartedProduct.new({ user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], status: "carted" })
    @carted_product.save

    if @carted_product.save
      render json: { carted_product: @carted_product }
    else
      render json: { error: "Error" }
    end
  end

  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.status = "removed"
    carted_product.save
    render json: { message: "Carted product successfully removed." }
  end
end
