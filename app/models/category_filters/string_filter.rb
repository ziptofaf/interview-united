module CategoryFilters
  class StringFilter < CategoryFilter
    def attribute_type
      ProductAttributes::StringAttribute
    end

    def field_type_in_form
      'text_field'
    end
  end

end