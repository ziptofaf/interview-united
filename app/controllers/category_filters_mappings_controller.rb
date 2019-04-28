class CategoryFiltersMappingsController < ApplicationController
  before_action :set_category
  before_action :set_mapping, only: [:show, :edit, :update, :destroy]
  include CategoryFiltersMappingsHelper
  def index
    @mappings = CategoryFiltersMapping.where(category: @category)
  end

  def new
    @mapping = CategoryFiltersMapping.new(category: @category)
  end

  def create
    @mapping = CategoryFiltersMapping.new(mapping_params)
    @mapping.category = @category
    if @mapping.save
      redirect_to category_category_filters_mapping_path(@category, @mapping)
    else
      render :new
    end
  end

  def show
  end

  def update
    if @mapping.update(mapping_params)
      redirect_to category_category_filters_mapping_path(@category, @mapping)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    if should_be_destroyable?(@mapping)
      @mapping.destroy
      redirect_to category_category_filters_mappings_path, notice: 'Mapping was successfully destroyed.'
    else
      redirect_to category_category_filters_mappings_path(@category), notice: 'Mapping cannot be destroyed as it originates higher up the tree'
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def set_mapping
    @mapping = CategoryFiltersMapping.find(params[:id])
  end

  def mapping_params
    params.require(:category_filters_mapping).permit(:category_filter_id)
  end
end
