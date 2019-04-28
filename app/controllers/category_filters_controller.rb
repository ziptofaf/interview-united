class CategoryFiltersController < ApplicationController
  before_action :set_category_filter, only: [:show, :edit, :update, :destroy]

  # GET /category_filters
  # GET /category_filters.json
  def index
    @category_filters = CategoryFilter.all
  end

  # GET /category_filters/1
  # GET /category_filters/1.json
  def show
  end

  # GET /category_filters/new
  def new
    @category_filter = CategoryFilter.new
  end

  # GET /category_filters/1/edit
  def edit
  end

  # POST /category_filters
  # POST /category_filters.json
  def create
    @category_filter = CategoryFilter.new(category_filter_params)

    respond_to do |format|
      if @category_filter.save
        format.html { redirect_to @category_filter, notice: 'Category filter was successfully created.' }
        format.json { render :show, status: :created, location: @category_filter }
      else
        format.html { render :new }
        format.json { render json: @category_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_filters/1
  # PATCH/PUT /category_filters/1.json
  def update
    respond_to do |format|
      if @category_filter.update(category_filter_params)
        format.html { redirect_to @category_filter, notice: 'Category filter was successfully updated.' }
        format.json { render :show, status: :ok, location: @category_filter }
      else
        format.html { render :edit }
        format.json { render json: @category_filter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_filters/1
  # DELETE /category_filters/1.json
  def destroy
    @category_filter.destroy
    respond_to do |format|
      format.html { redirect_to category_filters_url, notice: 'Category filter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category_filter
    @category_filter = CategoryFilter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_filter_params
    params.require(:category_filter).permit(:name, :type)
  end
end
