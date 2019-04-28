class DictionaryFilterValuesController < ApplicationController
  before_action :set_category_filter
  before_action :set_dictionary_filter_value, only: [:show, :edit, :update, :destroy]

  def index
    @dictionary_filter_values = DictionaryFilterValue.where(category_filter: @category_filter)
  end

  def new
    @dictionary_filter_value = DictionaryFilterValue.new(category_filter: @category_filter)
    @url = category_filter_dictionary_filter_values_path
  end

  def show
  end

  def edit
    @url = category_filter_dictionary_filter_value_path(@category_filter, @dictionary_filter_value)
  end

  def create
    @dictionary_filter_value = DictionaryFilterValue.new(dictionary_params)
    @dictionary_filter_value.category_filter = @category_filter
    if @dictionary_filter_value.save
      redirect_to category_filter_dictionary_filter_value_path(@category_filter, @dictionary_filter_value)
    else
      render :new
    end
  end

  def update
    if @dictionary_filter_value.update(dictionary_params)
      redirect_to category_filter_dictionary_filter_value_path(@category_filter, @dictionary_filter_value)
    else
      render :edit
    end
  end

  def destroy
    @dictionary_filter_value.destroy
    redirect_to category_filter_dictionary_filter_values_path(@category_filter), notice: 'Dictionary value was successfully destroyed.'
  end

  private

  def set_category_filter
    @category_filter = CategoryFilter.find(params[:category_filter_id])
  end

  def set_dictionary_filter_value
    @dictionary_filter_value = DictionaryFilterValue.find(params[:id])
  end

  def dictionary_params
    params.require(:dictionary_filter_value).permit(:name)
  end
end