class ChangePriceDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :decimal, precision: 11, scale: 2
  end
end
