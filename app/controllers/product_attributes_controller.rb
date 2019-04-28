class ProductAttributesController < ApplicationController
  before_action :set_product
  before_action :set_product_attribute, only: [:edit, :show, :update]

  def index
    @product_attributes = ProductAttribute.where(product: @product)
  end

  def edit
  end

  def show
  end

  def update
    if @product_attribute.update(product_attribute_params)
      redirect_to edit_product_product_attribute_path(@product, @product_attribute)
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_product_attribute
    @product_attribute = ProductAttribute.find(params[:id])
  end

  def product_attribute_params
    params.require(:product_attribute).permit(:value)
  end
end