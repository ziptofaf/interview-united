class DictionaryFilterValue < ApplicationRecord
  belongs_to :category_filter
  validate :assigned_filter_must_be_dictionary_filter

  private

  def assigned_filter_must_be_dictionary_filter
    return if category_filter.type == 'CategoryFilters::DictionaryFilter'

    errors.add(:category_filter, 'must be a dictionary filter')
  end
end
