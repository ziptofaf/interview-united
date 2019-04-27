# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/show', type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
                                    name: 'Name',
                                    parent_category: 2
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
