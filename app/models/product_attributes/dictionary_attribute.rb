module ProductAttributes
  class DictionaryAttribute < ProductAttribute
    validate :must_exist_in_dictionary

    def value
      string_value
    end

    def value=(val)
      self.string_value = val
    end

    private

    def must_exist_in_dictionary
      return if category_filter.available_values.include?(string_value)

      errors.add(:value, 'Text value must exist in a connected dictionary')
    end
  end
end