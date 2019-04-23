FactoryBot.define do
  factory :dictionary_filter_value do
    association :category_filter, factory: 'CategoryFilters::DictionaryFilter'
    name { 'SampleValue' }
  end
end
