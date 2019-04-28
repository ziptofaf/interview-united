module ProductAttributes
  class StringAttribute < ProductAttribute

    def self.where_value(value)
      where(string_value: value)
    end

    def value
      string_value
    end

    def value=(val)
      self.string_value = val
    end
  end
end