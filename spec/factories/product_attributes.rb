FactoryBot.define do
  factory :product_attribute do
    product
    category_filter
    type { "" }

    factory 'ProductAttributes::BooleanAttribute' do
      value { true }
      type { 'ProductAttributes::BooleanAttribute' }
      association :category_filter, factory: 'CategoryFilters::BooleanFilter'
    end

    factory 'ProductAttributes::DecimalAttribute' do
      value { 1.0 }
      type { 'ProductAttributes::DecimalAttribute' }
      association :category_filter, factory: 'CategoryFilters::DecimalFilter'
    end

    factory 'ProductAttributes::IntegerAttribute' do
      value { 1 }
      type { 'ProductAttributes::IntegerAttribute' }
      association :category_filter, factory: 'CategoryFilters::IntegerFilter'
    end

    factory 'ProductAttributes::StringAttribute' do
      value { "String" }
      type { 'ProductAttributes::StringAttribute' }
      association :category_filter, factory: 'CategoryFilters::StringFilter'
    end

    factory 'ProductAttributes::DictionaryAttribute' do
      value { "Word" }
      type { 'ProductAttributes::DictionaryAttribute' }
      association :category_filter, factory: 'CategoryFilters::DictionaryFilter'
    end
  end
end
