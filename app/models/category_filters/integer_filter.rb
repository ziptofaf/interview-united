module CategoryFilters
  class IntegerFilter < CategoryFilter
    def value=(val)
      self.integer_value = val
    end

    def value
      integer_value
    end

    def attribute_type
      ProductAttributes::IntegerAttribute
    end
  end
end