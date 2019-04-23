class ProductAttribute < ApplicationRecord
  belongs_to :product
  belongs_to :category_filter

  attribute :value
end
