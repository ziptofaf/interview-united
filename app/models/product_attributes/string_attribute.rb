module ProductAttributes
  class StringAttribute < ProductAttribute

    def value
      string_value
    end

    def value=(val)
      self.string_value = val
    end
  end
end