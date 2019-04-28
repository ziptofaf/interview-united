class RenameParentCategoryToParentCategoryId < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :parent_category, :parent_category_id
  end
end
