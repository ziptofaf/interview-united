# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before(:each) do
    assign(:categories, [
             Category.create!(
               name: 'Name1',
             ),
             Category.create!(
               name: 'Name2',
             )
           ])
  end

  it 'renders a list of categories' do
    render
    assert_select 'tr>td', text: 'Name1', count: 1
    assert_select 'tr>td', text: 'Name2', count: 1
    assert_select 'tr>td', text: 'No parent', count: 2
  end
end
