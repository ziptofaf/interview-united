module ProductAttributes
  class DictionaryAttribute < StringAttribute
    validate :must_exist_in_dictionary

    private

    def must_exist_in_dictionary
      return if category_filter.available_values.include?(string_value)

      errors.add(:value, 'Text value must exist in a connected dictionary')
    end
  end
end