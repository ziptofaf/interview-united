class ProductAttribute < ApplicationRecord
  include FormUsableConcern
  belongs_to :product
  belongs_to :category_filter

  attribute :value

  validate :type_cannot_be_changed


  private

  def type_cannot_be_changed
    errors.add(:type, 'Change of type is not allowed!') if type_changed? && persisted?
  end


end
