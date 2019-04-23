module CategoryFilters
  class DictionaryFilter < CategoryFilter

    def value=(val)
      self.string_value = val
    end

    def value
      string_value
    end

    has_many :dictionary_filter_values

    def available_values
      dictionary_filter_values.map(&:name)
    end
  end
end