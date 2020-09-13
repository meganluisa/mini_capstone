class Api::ProductsController < ApplicationController
  def index
    @products = Product.all

    if params[:search]
      @products = @products.where("title ILIKE ?", "%#{params[:search]}%")
    end
    if params[:discount] == "true"
      @products = @products.where("price < ?", 1000000)
    end

    if params[:sort] == "price" && params[:sort_order] == "desc"
      @products = @products.order(price: :desc)
    elsif params[:sort] == "price" && params[:sort_order] == "asc"
      @products = @products.order(price: :asc)
    else
      @products = @products.order(id: :asc)
    end

    render "index.json.jb"
  end

  def show
    @product = Product.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @product = Product.new ({ title: params[:title], artist: params[:artist], price: params[:price], description: params[:description] })
    @product.save

    if @product.save
      render "create.json.jb"
    else
      render json: { error: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.title = params[:title] || @product.title
    @product.artist = params[:artist] || @product.artist
    @product.price = params[:price] || @product.price
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
