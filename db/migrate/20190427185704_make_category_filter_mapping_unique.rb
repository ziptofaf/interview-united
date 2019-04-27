class MakeCategoryFilterMappingUnique < ActiveRecord::Migration[5.2]
  def change
    add_index :category_filters_mappings, [:category_id, :category_filter_id], unique: true, name: :category_category_filter_index
  end
end
