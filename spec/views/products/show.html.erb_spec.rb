# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'products/show', type: :view do
  before(:each) do
    category = FactoryBot.create(:category, name: 'Food')
    category.category_filters.push(FactoryBot.create(:category_filter, name: 'Price', type: 'CategoryFilters::DecimalFilter'))
    @product = assign(:product, Product.create!(
                                  name: 'Name',
                                  category: category
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Food/)
  end
end
