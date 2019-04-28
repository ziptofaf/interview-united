# frozen_string_literal: true

class CategoryFilter < ApplicationRecord
  include FormUsableConcern
  has_many :category_filters_mappings, dependent: :destroy
  has_many :categories, through: :category_filters_mappings
  has_many :product_attributes, dependent: :destroy

  validate :type_cannot_be_changed

  validates_length_of :name, minimum: 2



  private

  def type_cannot_be_changed
    errors.add(:type, 'Change of type is not allowed!') if type_changed? && persisted?
  end


end
