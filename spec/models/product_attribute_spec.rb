# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProductAttribute, type: :model do
  before(:each) do
    @category = FactoryBot.create(:category, name: 'test-category')
    @int_filter = FactoryBot.create('CategoryFilters::IntegerFilter', name: 'abc')
    @bool_filter = FactoryBot.create('CategoryFilters::BooleanFilter', name: 'abc')
    @string_filter = FactoryBot.create('CategoryFilters::StringFilter', name: 'abc')
    @decimal_filter = FactoryBot.create('CategoryFilters::DecimalFilter', name: 'abc')
    @dictionary_filter = FactoryBot.create('CategoryFilters::DictionaryFilter', name: 'abc')
    @category.category_filters.push([@int_filter, @bool_filter, @string_filter, @decimal_filter, @dictionary_filter])
    @value = FactoryBot.create(:dictionary_filter_value, name: 'Tesla', category_filter: @dictionary_filter)
    @value = FactoryBot.create(:dictionary_filter_value, name: 'Lexus', category_filter: @dictionary_filter)
    @product = FactoryBot.create(:product, name: 'Sample', category: @category)
  end

  it 'only allows you to use specific values in DictionaryFilters' do
    val = FactoryBot.build('ProductAttributes::DictionaryAttribute', value: 'not-valid', product: @product,
                                                                     category_filter: @dictionary_filter)
    expect(val.valid?).to eq false
    expect(val.errors.details).to eq(value: [{ error: 'Text value must exist in a connected dictionary' }])
    val2 = FactoryBot.build('ProductAttributes::DictionaryAttribute', value: 'Tesla', product: @product,
                                                                      category_filter: @dictionary_filter)
    expect(val2.valid?).to eq true
    expect(val2.string_value).to eq 'Tesla'
  end
end
