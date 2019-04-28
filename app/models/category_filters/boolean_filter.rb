module CategoryFilters
  class BooleanFilter < CategoryFilter

    def value=(val)
      self.boolean_value = val
    end

    def value
      boolean_value
    end

    def attribute_type
      ProductAttributes::BooleanAttribute
    end
  end
end