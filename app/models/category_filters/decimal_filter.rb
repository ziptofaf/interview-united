module CategoryFilters
  class DecimalFilter < CategoryFilter
    def value=(val)
      self.decimal_value = val
    end

    def value
      decimal_value
    end

    def attribute_type
      ProductAttributes::DecimalAttribute
    end
  end
end