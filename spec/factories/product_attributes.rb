FactoryBot.define do
  factory :product_attribute do
    product
    category_filter
    type { "" }

    factory 'ProductAttributes::BooleanAttribute', class: ProductAttributes::BooleanAttribute do
      value { true }
      association :category_filter, factory: 'CategoryFilters::BooleanFilter'
    end

    factory 'ProductAttributes::DecimalAttribute', class: ProductAttributes::DecimalAttribute do
      value { 1.0 }
      association :category_filter, factory: 'CategoryFilters::DecimalFilter'
    end

    factory 'ProductAttributes::IntegerAttribute', class: ProductAttributes::IntegerAttribute do
      value { 1 }
      association :category_filter, factory: 'CategoryFilters::IntegerFilter'
    end

    factory 'ProductAttributes::StringAttribute', class: ProductAttributes::StringAttribute do
      value { "String" }
      association :category_filter, factory: 'CategoryFilters::StringFilter'
    end

    factory 'ProductAttributes::DictionaryAttribute', class: ProductAttributes::DictionaryAttribute do
      value { "sample" }
      association :category_filter, factory: 'CategoryFilters::DictionaryFilter'
    end
  end
end
