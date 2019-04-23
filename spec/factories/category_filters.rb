FactoryBot.define do
  factory :category_filter do
    name { "MyString" }
    type { "" }
  end

  factory 'CategoryFilters::BooleanFilter', class: CategoryFilters::BooleanFilter do
    name {"Bool"}
  end

  factory 'CategoryFilters::DecimalFilter', class: CategoryFilters::DecimalFilter do
    name {"Dec"}
  end

  factory 'CategoryFilters::IntegerFilter', class: CategoryFilters::IntegerFilter do
    name {"Int"}
  end

  factory 'CategoryFilters::StringFilter', class: CategoryFilters::StringFilter do
    name {"String"}
  end

  factory 'CategoryFilters::DictionaryFilter', class: CategoryFilters::DictionaryFilter do
    name {"Dict"}
    after :create do |model|
      sample_value = DictionaryFilterValue.new
      sample_value.name = "sample"
      sample_value.category_filter = model
      sample_value.save
    end
  end


end
