module CategoryFilters
  class DecimalFilter < CategoryFilter
    def attribute_type
      ProductAttributes::DecimalAttribute
    end
  end
end