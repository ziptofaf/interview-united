# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'category_filters/show', type: :view do
  before(:each) do
    @category_filter = assign(:category_filter, CategoryFilter.create!(
                                                  name: 'Name',
                                                  type: 'CategoryFilters::StringFilter'
                                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/CategoryFilters::StringFilter/)
  end
end
