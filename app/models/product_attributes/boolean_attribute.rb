module ProductAttributes
  class BooleanAttribute < ProductAttribute

    def value
      boolean_value
    end

    def value=(val)
      self.boolean_value = val
    end
  end
end