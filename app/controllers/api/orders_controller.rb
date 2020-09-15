class Api::OrdersController < ApplicationController
  def create
    order = Order.new({ id: current_user })
  end
end
