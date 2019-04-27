class ChangeCategoryHabtmToFullModel < ActiveRecord::Migration[5.2]
  def change
    rename_table 'categories_category_filters', 'category_filters_mappings'
    add_column :category_filters_mappings, :id, :primary_key
  end
end
