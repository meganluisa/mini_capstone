class Api::ProductsController < ApplicationController
  def all_products
    @all_artworks = Product.all
  end
end
