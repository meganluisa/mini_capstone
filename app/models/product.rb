class Product < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%m/%d/%Y %I:%M%p")
  end
end
