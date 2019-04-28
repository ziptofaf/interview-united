require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @root = FactoryBot.create(:category, name: 'Root')
    @filter = FactoryBot.create('CategoryFilters::BooleanFilter', name: 'TestBoolFilter')
    @root.category_filters.push(@filter)
    @child = FactoryBot.create(:category, name: 'Child', parent: @root)
    @nested_filter = FactoryBot.create('CategoryFilters::DecimalFilter', name: 'TestDecimalFilter')
    @child.category_filters.push(@nested_filter)
    @nested_child = FactoryBot.create(:category, name: 'NestedChild', parent: @child)
  end

  it 'doesnt allow creation of a product at any category other than lowest one' do
    product = FactoryBot.build(:product, category: @child)
    expect(product.valid?).to eq false
    expect(product.errors.details).to eq(category: [{ error: 'must have no further children (end of the tree)' }])
  end

  it 'creates product attribute for each filter connected' do
    product = FactoryBot.create(:product, category: @nested_child)
    expect(product.product_attributes.count).to eq @nested_child.category_filters.count
  end

  it 'is possible to move Product to a different category, at a cost of wrong attributes being destroyed' do
    product = FactoryBot.create(:product, category: @nested_child)
    new_category = FactoryBot.create(:category, name: 'Sample', parent: @root)
    product.update(category: new_category)
    expect(product.product_attributes.count).to eq 1
  end
end
