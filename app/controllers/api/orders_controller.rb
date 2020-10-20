class Api::OrdersController < ApplicationController
  before_action :authenticate_user, except: [:index]

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  # def show
  #   @order = current_user.orders.find_by(id: params[:id])
  #   render json: { order: @order }
  # end

  def create
    carted_products = CartedProduct.where("user_id = ? AND status = ?", current_user.id, "carted")
    subtotal = 0
    carted_products.each do |carted_product|
      product = Product.find_by(id: carted_product.product_id)
      subtotal += product.price
    end
    tax = 0.9
    total = subtotal + (tax * subtotal)
    @order = Order.new({ user_id: current_user.id, subtotal: subtotal, tax: tax, total: total })
    # subtotal = product.price * params[:quantity].to_i
    # tax = 0.9
    # total = subtotal + (tax * subtotal)
    # @order = Order.new({ user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], subtotal: subtotal, tax: tax, total: total })
    # @order.save
    if @order.save
      carted_products.each do |carted_product|
        carted_product.status = "purchased"
        carted_product.order_id = @order.id
      end
      render "show.json.jb"
    else
      render json: { errors: product } #@order.errors.full_messages
    end
  end
end
