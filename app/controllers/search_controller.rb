class SearchController < ApplicationController
  def index
    @category = Category.find_by(id: params[:category_id])
    @category ||= Category.find_by(name: 'Root')
    product_categories = @category.all_children.filter(&:tree_end?) + [@category]
    @products = Product.where(category_id: product_categories).includes(:product_attributes)
  end

  def filtered
  end
end
