class CategoryFilter < ApplicationRecord
  has_and_belongs_to_many :categories
  has_many :product_attributes
end
