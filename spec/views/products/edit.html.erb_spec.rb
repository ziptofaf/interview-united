# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/edit', type: :view do
  before(:each) do
    category = FactoryBot.create(:category, name: 'Food')
    category.category_filters.push(FactoryBot.create(:category_filter, name: 'Price', type: 'CategoryFilters::DecimalFilter'))
    @product = assign(:product, Product.create!(
      name: 'MyString',
      category: category
    ))
  end

  it 'renders the edit product form' do
    render

    assert_select 'form[action=?][method=?]', product_path(@product), 'post' do

      assert_select 'input[name=?]', 'product[name]'
    end
  end
end
