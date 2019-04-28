module CategoryFilters
  class StringFilter < CategoryFilter
    def attribute_type
      ProductAttributes::StringAttribute
    end
  end
end