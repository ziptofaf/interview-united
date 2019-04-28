module CategoryFilters
  class BooleanFilter < CategoryFilter
    def attribute_type
      ProductAttributes::BooleanAttribute
    end

    def field_type_in_form
      'check_box'
    end

  end
end