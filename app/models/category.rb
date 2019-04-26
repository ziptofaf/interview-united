class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_category', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_category', dependent: :destroy
  has_and_belongs_to_many :category_filters
  after_create :copy_parent_filters


  def copy_parent_filters
    current_node = parent

    return unless parent # mozliwe z rootem

    filters_arr = category_filters.map(&:id)
    loop do
      break if current_node.nil?

      filters_to_add = current_node.category_filters.where.not(id: filters_arr).map(&:id)
      filters_arr += filters_to_add
      current_node = current_node.parent
    end
    filters_arr.each do |filter_id|
      category_filters.push(CategoryFilter.find(filter_id))
    end
  end

  def search_filters
    return category_filters if tree_end?

    end_nodes = []
    queue = children.to_a
    until queue.empty?
      node = queue.pop
      if node.tree_end?
        end_nodes.push(node)
      else
        queue += node.children.to_a
        queue.flatten!
      end
    end
    common_filters_in_categories(end_nodes)
  end

  def tree_end?
    children.empty?
  end

  private

  def common_filters_in_categories(categories)
    p categories.map(&:name)
    categories_filters = categories.map(&:search_filters)
    categories_filters.inject(:&) # intersection between N arrays
  end

end
