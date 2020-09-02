class Api::ProductsController < ApplicationController
  def all_products
    @all_artworks = Product.all
    render "all_products.json.jb"
  end

  def first_product
    @first_product = Product.first
    render "first_product.json.jb"
  end
end
