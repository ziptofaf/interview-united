# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DictionaryFilterValue, type: :model do
  it 'is not possible to assign this value to something else than dicionary filter' do
    wrong_filter = FactoryBot.create('CategoryFilters::DecimalFilter')
    value = FactoryBot.build(:dictionary_filter_value, category_filter: wrong_filter)
    expect(value.valid?).to eq false
    expect(value.errors.messages).to eq category_filter: ['must be a dictionary filter']
  end
end
