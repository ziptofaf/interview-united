class MakeProductAttributeUniqueToProductAndFilter < ActiveRecord::Migration[5.2]
  def change
    add_index :product_attributes, [:product_id, :category_filter_id], unique: true
  end
end
