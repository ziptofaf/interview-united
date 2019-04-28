class SearchController < ApplicationController
  def index
    @category = Category.find_by(id: params[:search][:category_id]) if params[:search]
    @category ||= Category.find_by(id: params[:category_id])
    @category ||= Category.find_by(name: 'Root')
    product_categories = @category.all_children.filter(&:tree_end?) + [@category]
    @products = Product.where(category_id: product_categories).includes(:product_attributes)
    use_search_form_builder if params[:search]
  end

  def use_search_form_builder
    builder = Forms::SearchFormBuilder.new(params[:search][:filters])
    @products = builder.products(@products)
  end

end
