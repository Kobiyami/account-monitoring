class CategoriesController < ApplicationController
  before_action :set_category, only: [:update, :destroy]

  # GET /years/:year_id/categories
  def index
    @categories = Category.all
    render json: @categories
  end

  # POST /years/:year_id/categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /years/:year_id/categories/:id
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /years/:year_id/categories/:id
  def destroy
    @category.destroy
    head :no_content
  end

  private

  # Utilisé pour les actions update et destroy
  def set_category
    @category = Category.find(params[:id])
  end

  # Strong parameters
  def category_params
    params.require(:category).permit(:name, :category_type)
  end
end
