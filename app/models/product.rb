class Product < ApplicationRecord
  validates :title, :artist, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 2..500 }
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images

  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y %I:%M%p")
  end
end
