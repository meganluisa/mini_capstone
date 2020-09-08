class Product < ApplicationRecord
  validates :title, :artist, :price, presence: true
  validates :price, numerically: { greater_than: 0 }
  validates :description, length: { in: 2..500 }

  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y %I:%M%p")
  end
end
