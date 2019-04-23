class CreateProductAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_attributes do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :category_filter, foreign_key: true
      t.string :type
      t.integer :integer_value
      t.decimal :decimal_value
      t.string :string_value
      t.boolean :boolean_value

      t.timestamps
    end
  end
end
