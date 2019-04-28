# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category
  has_many :product_attributes
  validate :category_must_have_no_children

  def all_attributes_defined?
    filters_ids = category.category_filters.map(&:id)
    existing_attributes = product_attributes.where(category_filter_id: filters_ids).count
    existing_attributes == filters_ids.count
  end

  def build_lacking_attributes
    category.category_filters.each do |filter|
      next if product_attributes.exists?(category_filter: filter)

      prod_attr = filter.attribute_type.new
      prod_attr.save!
    end
  end

  private

  def category_must_have_no_children
    return if category.tree_end?

    errors.add(:category, 'must have no further children (end of the tree)')
  end
end
