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
  end
end