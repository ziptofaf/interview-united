# frozen_string_literal: true

class Product < ApplicationRecord
  belongs_to :category

  validate :category_must_have_no_children

  private

  def category_must_have_no_children
    return if category.children.empty?

    errors.add(:category, 'must have no further children (end of the tree)')
  end
end
