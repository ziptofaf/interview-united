# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'category_filters/index', type: :view do
  before(:each) do
    assign(:category_filters, [
             CategoryFilter.create!(
               name: 'Name',
               type: 'CategoryFilters::StringFilter'
             ),
             CategoryFilter.create!(
               name: 'Name',
               type: 'CategoryFilters::StringFilter'
             )
           ])
  end

  it 'renders a list of category_filters' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'CategoryFilters::StringFilter'.to_s, count: 2
  end
end
