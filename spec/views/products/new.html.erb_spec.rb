require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    category = FactoryBot.create(:category, name: 'Food')
    category.category_filters.push(FactoryBot.create(:category_filter, name: 'Price', type: 'CategoryFilters::DecimalFilter'))
    assign(:product, Product.new(
                       :name => "MyString",
                       :category => category
                     ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input[name=?]", "product[name]"
    end
  end
end
