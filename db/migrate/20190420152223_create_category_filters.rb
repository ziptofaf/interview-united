class CreateCategoryFilters < ActiveRecord::Migration[5.2]
  def change
    create_table :category_filters do |t|
      t.string :name, null: false
      t.string :type

      t.timestamps
    end
  end
end
