class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new ({ title: params[:title], artist: params[:artist], price: params[:price], image_url: params[:image_url], description: params[:description] })
    @product.save
    render "create.json.jb"
  end

  def update
    @product = Product.find_by(id: params[:id])

    @product.title = params[:title] || @product.title
    @product.artist = params[:artist] || @product.artist
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save

    render "show.json.jb"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product destroyed successfully." }
  end
end
