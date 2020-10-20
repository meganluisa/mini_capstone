class ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.html.erb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @product = Product.new({
      title: params[:title],
      artist: params[:artist],
      price: params[:price],
      description: params[:description],
      stock: params[:stock],
      supplier_id: 2,
    })
    @product.save
    redirect_to "/products"
  end
end
