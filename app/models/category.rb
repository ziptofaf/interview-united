class Category < ApplicationRecord
  belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_category', optional: true
  has_many :children_categories, class_name: 'Category', foreign_key: 'parent_category'
  has_and_belongs_to_many :category_filters
end
