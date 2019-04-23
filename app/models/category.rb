class Category < ApplicationRecord
  belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_category', optional: true
  has_many :children_categories, class_name: 'Category', foreign_key: 'parent_category', dependent: :destroy
  has_and_belongs_to_many :category_filters
  after_create :copy_parent_filters


  def copy_parent_filters
    current_node = parent_category

    return unless parent_category # mozliwe z rootem

    filters_arr = category_filters.map(&:id)
    loop do
      break if current_node.nil?

      filters_to_add = current_node.category_filters.where.not(id: filters_arr).map(&:id)
      filters_arr += filters_to_add
      current_node = current_node.parent_category
    end
    filters_arr.each do |filter_id|
      category_filters.push(CategoryFilter.find(filter_id))
    end
  end



end
