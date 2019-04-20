# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lint' do
  it 'generates every model defined in factories correctly' do
    FactoryBot.lint
  end
end
