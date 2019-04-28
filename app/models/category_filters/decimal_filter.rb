module CategoryFilters
  class DecimalFilter < CategoryFilter
    def attribute_type
      ProductAttributes::DecimalAttribute
    end

    def field_type_in_form
      'number_field'
    end
  end
end