class Api::OrdersController < ApplicationController
  def create
    if current_user
      # tax = 0.9
      # subtotal = params[:product_id].price
      product = Product.find_by(id: params[:product_id])
      subtotal = product.price * params[:quantity].to_i
      tax = 0.9
      total = subtotal + (tax * subtotal)
      @order = Order.new({ user_id: current_user.id, product_id: params[:product_id], quantity: params[:quantity], subtotal: subtotal, tax: tax, total: total })
      @order.save
      if @order.save
        render "show.json.jb"
      end
    else
      render json: { error: @order.errors.full_messages }
    end
  end
end
