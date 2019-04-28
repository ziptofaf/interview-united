module ProductAttributes
  class BooleanAttribute < ProductAttribute

    def self.where_value(value)
      where(boolean_value: value)
    end

    def value
      boolean_value
    end

    def value=(val)
      self.boolean_value = val
    end

    def field_type_in_form
      'check_box'
    end
  end
end