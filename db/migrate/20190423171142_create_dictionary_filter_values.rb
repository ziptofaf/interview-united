class CreateDictionaryFilterValues < ActiveRecord::Migration[5.2]
  def change
    create_table :dictionary_filter_values do |t|
      t.belongs_to :category_filter, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
