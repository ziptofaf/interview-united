class DictionaryFilterValuesController < ApplicationController
  before_action :set_category_filter
  before_action :set_dictionary_filter_value, only: [:show, :edit, :update, :destroy]

  def index
    @dictionary_filter_values = DictionaryFilterValue.where(category_filter: @category_filter)
  end

  def show

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  private

  def set_category_filter
    @category_filter = CategoryFilter.find(params[:category_filter_id])
  end

  def set_dictionary_filter_value
    @dictionary_filter_value = DictionaryFilterValue.find(params[:id])
  end
end