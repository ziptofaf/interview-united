module CategoryFilters
  class IntegerFilter < CategoryFilter
    def attribute_type
      ProductAttributes::IntegerAttribute
    end

    def field_type_in_form
      'number_field'
    end
  end

end