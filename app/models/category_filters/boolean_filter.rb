module CategoryFilters
  class BooleanFilter < CategoryFilter

    def value=(val)
      self.boolean_value = val
    end

    def value
      boolean_value
    end
  end
end