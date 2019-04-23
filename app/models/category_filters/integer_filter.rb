module CategoryFilters
  class IntegerFilter < CategoryFilter
    def value=(val)
      self.int_value = val
    end

    def value
      int_value
    end
  end
end