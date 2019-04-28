module CategoryFilters
  class DictionaryFilter < CategoryFilter
    has_many :dictionary_filter_values, class_name: 'DictionaryFilterValue', foreign_key: 'category_filter_id', dependent: :destroy

    def available_values
      dictionary_filter_values.map(&:name)
    end

    def attribute_type
      ProductAttributes::DictionaryAttribute
    end

  end
end