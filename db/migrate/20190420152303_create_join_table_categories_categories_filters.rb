class CreateJoinTableCategoriesCategoriesFilters < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :category_filters do |t|
      # t.index [:category_id, :categories_filter_id]
      # t.index [:categories_filter_id, :category_id]
    end
  end
end
