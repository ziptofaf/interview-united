class ProductAttribute < ApplicationRecord
  include FormUsableConcern
  belongs_to :product
  belongs_to :category_filter

  # by defining this field in descendants we get a uniform interface for interacting with database
  attribute :value

  def self.where_value(value)
    raise "has to be defined in #{__FILE__}"
  end

  validate :type_cannot_be_changed

  private

  def type_cannot_be_changed
    errors.add(:type, 'Change of type is not allowed!') if type_changed? && persisted?
  end


end
