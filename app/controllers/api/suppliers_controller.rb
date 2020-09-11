class Api::SuppliersController < ApplicationController
  def show
    @supplier = Supplier.find_by(id: params[:id])
    render "show.json.jb"
  end
end
