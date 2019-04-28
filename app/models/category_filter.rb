class CategoryFilter < ApplicationRecord
  has_many :category_filters_mappings, dependent: :destroy
  has_many :categories, through: :category_filters_mappings
  has_many :product_attributes, dependent: :destroy

  validates_length_of :name, minimum: 2

end
