# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'category_filters/edit', type: :view do
  before(:each) do
    @category_filter = assign(:category_filter, CategoryFilter.create!(
                                                  name: 'MyString',
                                                  type: 'CategoryFilter'
                                                ))
  end

  it 'renders the edit category_filter form' do
    render

    assert_select 'form[action=?][method=?]', category_filter_path(@category_filter), 'post' do
      assert_select 'input[name=?]', 'category_filter[name]'

      assert_select 'input[name=?]', 'category_filter[type]'
    end
  end
end
