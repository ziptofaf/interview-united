# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @root = FactoryBot.create(:category, name: 'Root')
    @filter = FactoryBot.create('CategoryFilters::BooleanFilter', name: 'TestBoolFilter')
    @root.category_filters.push(@filter)
    @child = FactoryBot.create(:category, name: 'Child', parent: @root)
    @nested_filter = FactoryBot.create('CategoryFilters::DecimalFilter', name: 'TestDecimalFilter')
    @child.category_filters.push(@nested_filter)
    @nested_child = FactoryBot.create(:category, name: 'NestedChild', parent: @child)
  end

  it 'correctly detects all children of a given node' do
    all_children = @root.all_children
    expect(all_children).to include(@child, @nested_child)
  end

  it 'is correctly created and relationships to filters from parents are preserved' do
    expect(@nested_child.category_filters).to include(@filter, @nested_filter)
  end

  it 'correctly deletes associations to filters to children when they are changed in root' do
    @root.category_filters.destroy(@filter)
    expect(@root.category_filters.to_a).to eq []
    expect(@child.reload.category_filters.to_a).to eq [@nested_filter]
  end

  it 'correctly adds associations to filters to children when they are changed in root' do
    filter = FactoryBot.create('CategoryFilters::BooleanFilter', name: 'TestFilter')
    @root.category_filters.push(filter)
    expect(@child.reload.category_filters).to include(@filter, @nested_filter, filter)
  end

  it 'correctly returns a filter list in an arbitrarily nested tree' do
    # fairly unique and complex structure, thats why i am not using instance defined categories,
    # these are for other tests
    price_filter = FactoryBot.create('CategoryFilters::DecimalFilter', name: 'Price')
    engine_filter = FactoryBot.create('CategoryFilters::StringFilter', name: 'Engine type')
    american_filter = FactoryBot.create('CategoryFilters::BooleanFilter', name: 'American imported')
    age_filter = FactoryBot.create('CategoryFilters::IntegerFilter', name: 'Years old')

    tree_root = FactoryBot.create(:category, name: 'Root1')
    tree_root.category_filters += [price_filter]

    motorization_node = FactoryBot.create(:category, name: 'Motorization', parent: tree_root)
    motorization_node.category_filters += [age_filter]
    cars_node = FactoryBot.create(:category, name: 'Cars', parent: motorization_node)
    volvo_node = FactoryBot.create(:category, name: 'Volvo', parent: cars_node)
    volvo_node.category_filters += [engine_filter]
    bmw_node = FactoryBot.create(:category, name: 'BMW', parent: cars_node)
    bmw_node.category_filters += [american_filter, engine_filter]

    root_filters = tree_root.search_filters
    expect(root_filters).to include(price_filter, age_filter, engine_filter)

    bmw_filters = bmw_node.search_filters
    expect(bmw_filters).to include(price_filter, age_filter, engine_filter, american_filter)

    # adding a category right below the root with new set of filters should leave bmw unchanged but
    # vastly change root

    FactoryBot.create(:category, name: 'Food', parent: tree_root)
    root_filters = tree_root.reload.search_filters
    expect(root_filters.to_a == [price_filter]).to eq true
    bmw_filters = bmw_node.search_filters
    expect(bmw_filters).to include(price_filter, age_filter, engine_filter, american_filter)
  end

end