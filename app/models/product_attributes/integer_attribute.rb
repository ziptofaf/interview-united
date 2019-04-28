module ProductAttributes
  class IntegerAttribute < ProductAttribute

    def self.where_value(value)
      where(integer_value: value)
    end

    def value
      integer_value
    end

    def value=(val)
      self.integer_value = val
    end

    def field_type_in_form
      'number_field'
    end
  end
end