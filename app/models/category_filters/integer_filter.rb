module CategoryFilters
  class IntegerFilter < CategoryFilter
    def attribute_type
      ProductAttributes::IntegerAttribute
    end
  end
end