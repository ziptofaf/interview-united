module ProductAttributes
  class DecimalAttribute < ProductAttribute

    def self.where_value(value)
      where(decimal_value: value)
    end

    def value
      decimal_value
    end

    def value=(val)
      self.decimal_value = val
    end

    def field_type_in_form
      'number_field'
    end

    def extra_fields_in_form
      [step: 0.01]
    end

  end
end