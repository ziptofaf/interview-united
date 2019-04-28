module CategoryFilters
  class StringFilter < CategoryFilter
    def value=(val)
      self.string_value = val
    end

    def value
      string_value
    end

    def attribute_type
      ProductAttributes::StringAttribute
    end
  end
end