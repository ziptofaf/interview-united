# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', foreign_key: 'parent_category_id', optional: true
  has_many :children, class_name: 'Category', foreign_key: 'parent_category_id', dependent: :destroy
  has_many :category_filters_mappings, dependent: :destroy
  has_many :category_filters, through: :category_filters_mappings
  has_many :products

  scope :without_children, lambda {
                             joins('LEFT OUTER JOIN categories as children ON categories.id = children.parent_category_id')
                               .where(children: { id: nil })
                           }

  after_create :copy_parent_filters

  validates_length_of :name, minimum: 2

  #needed for copy_filters_from controller action
  attribute :copy_from_id

  def copy_parent_filters
    return unless parent # mozliwe z rootem

    self.category_filters = parent.category_filters
  end

  def copy_filters_from(category)
    lacking_filters = category.category_filters.where.not(id: category_filters.map(&:id))
    lacking_filters.each do |filter|
      category_filters.push(filter)
    end
  end

  # returns filters that should be searchable within a given category
  def search_filters
    return category_filters if tree_end?

    reload
    end_nodes = all_children.filter(&:tree_end?)
    common_filters_in_categories(end_nodes)
  end

  def tree_end?
    reload
    children.empty?
  end

  def parent_filters
    return CategoryFilters.none unless parent

    parent.category_filters
  end

  # unlike just children, this one goes down the entire tree
  def all_children
    reload
    nodes = []
    queue = children.to_a
    until queue.empty?
      node = queue.pop
      nodes.push(node)
      queue += node.children.to_a
      queue.flatten!
    end
    nodes
  end

  private

  def common_filters_in_categories(categories)
    categories_filters = categories.map(&:search_filters)
    categories_filters.inject(:&) # intersection between N arrays
  end
end
