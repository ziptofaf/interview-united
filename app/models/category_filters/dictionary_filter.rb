module CategoryFilters
  class DictionaryFilter < CategoryFilter
    has_many :dictionary_filter_values
  end
end