# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'category_filters/new', type: :view do
  before(:each) do
    assign(:category_filter, CategoryFilter.new(
                               name: 'MyString',
                               type: 'CategoryFilter'
                             ))
  end

  it 'renders new category_filter form' do
    render

    assert_select 'form[action=?][method=?]', category_filters_path, 'post' do
      assert_select 'input[name=?]', 'category_filter[name]'

      assert_select 'input[name=?]', 'category_filter[type]'
    end
  end
end
