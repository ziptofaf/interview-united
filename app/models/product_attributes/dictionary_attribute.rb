module ProductAttributes
  class DictionaryAttribute < StringAttribute
    validate :must_exist_in_dictionary

    def self.where_value(value)
      where(string_value: value)
    end

    def field_type_in_form
      'text_field'
    end

    private

    def must_exist_in_dictionary
      return if category_filter.available_values.include?(string_value)
      return if string_value.nil? # nil is allowed when you create a new filter

      errors.add(:value, 'Text value must exist in a connected dictionary')
    end
  end
end