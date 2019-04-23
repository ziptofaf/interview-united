# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @root = FactoryBot.create(:category, name: 'Root')
    @filter = FactoryBot.create('CategoryFilters::BooleanFilter', name: 'TestBoolFilter')
    @root.category_filters.push(@filter)
    @child = FactoryBot.create(:category, name: 'Child', parent_category: @root)
    @nested_filter = FactoryBot.create('CategoryFilters::DecimalFilter', name: 'TestDecimalFilter')
    @child.category_filters.push(@nested_filter)
    @nested_child = FactoryBot.create(:category, name: 'NestedChild', parent_category: @child)
  end
  
  it 'is correctly created and relationships to filters from parents are preserved' do
    expect(@nested_child.category_filters).to eq [@filter, @nested_filter]
  end
end