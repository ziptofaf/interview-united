FactoryBot.define do
  factory :category_filter do
    name { "MyString" }
    type { "" }
  end

  factory 'CategoryFilters::BooleanFilter' do
    name {"Bool"}
    type {'CategoryFilters::BooleanFilter'}
  end

  factory 'CategoryFilters::DecimalFilter' do
    name {"Dec"}
    type {'CategoryFilters::DecimalFilter'}
  end

  factory 'CategoryFilters::IntegerFilter' do
    name {"Int"}
    type {'CategoryFilters::IntegerFilter'}
  end

  factory 'CategoryFilters::StringFilter' do
    name {"String"}
    type {'CategoryFilters::StringFilter'}
  end

  factory 'CategoryFilters::DictionaryFilter' do
    name {"Dict"}
    type {'CategoryFilters::DictionaryFilter'}
  end


end
