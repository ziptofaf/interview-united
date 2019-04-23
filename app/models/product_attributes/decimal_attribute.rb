module ProductAttributes
  class DecimalAttribute < ProductAttribute

    def value
      decimal_value
    end

    def value=(val)
      self.decimal_value = val
    end
  end
end