# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/index', type: :view do
  before(:each) do
    category = FactoryBot.create(:category, name: 'Food')
    category.category_filters.push(FactoryBot.create(:category_filter, name: 'Price', type: 'CategoryFilters::DecimalFilter'))
    assign(:products, [
      Product.create!(
        name: 'Name',
        category: category
      ),
      Product.create!(
        name: 'Name',
        category: category
      )
    ])
  end

  it 'renders a list of products' do
    render
    assert_select 'tr>td', text: 'Name', count: 2
    assert_select 'tr>td', text: 'Food', count: 2
  end
end
