class Product < ApplicationRecord
  validates :title, :artist, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }
  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products

  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y %I:%M%p")
  end
end
