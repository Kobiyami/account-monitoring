class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:update, :destroy]

  # GET /years/:year_id/categories/:category_id/subcategories
  def index
    @subcategories = Subcategory.where(category_id: params[:category_id])
    render json: @subcategories
  end

  # POST /years/:year_id/categories/:category_id/subcategories
  def create
    @subcategory = Subcategory.new(subcategory_params)
    @subcategory.category_id = params[:category_id]

    if @subcategory.save
      render json: @subcategory, status: :created
    else
      render json: @subcategory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /years/:year_id/categories/:category_id/subcategories/:id
  def update
    if @subcategory.update(subcategory_params)
      render json: @subcategory
    else
      render json: @subcategory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /years/:year_id/categories/:category_id/subcategories/:id
  def destroy
    @subcategory.destroy
    head :no_content
  end

  private

  # Utilisé pour les actions update et destroy
  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end

  # Strong parameters
  def subcategory_params
    params.require(:subcategory).permit(:name)
  end
end
