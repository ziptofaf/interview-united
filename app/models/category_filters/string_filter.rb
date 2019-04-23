module CategoryFilters
  class StringFilter < CategoryFilter
    def value=(val)
      self.string_value = val
    end

    def value
      string_value
    end
  end
end