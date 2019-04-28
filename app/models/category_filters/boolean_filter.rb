module CategoryFilters
  class BooleanFilter < CategoryFilter
    def attribute_type
      ProductAttributes::BooleanAttribute
    end
  end
end