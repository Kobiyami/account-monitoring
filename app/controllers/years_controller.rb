class YearsController < ApplicationController
  before_action :set_year, only: [:show, :update]

  # GET /years
  def index
    @years = Year.all
    render json: @years
  end

  # GET /years/:id
  def show
    render json: @year
  end

  # POST /years
  def create
    @year = Year.new(year_params)

    if @year.save
      render json: @year, status: :created
    else
      render json: @year.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /years/:id
  def update
    if @year.update(year_params)
      render json: @year
    else
      render json: @year.errors, status: :unprocessable_entity
    end
  end

  private

  # Utilisé pour les actions show et update
  def set_year
    @year = Year.find(params[:id])
  end

  # Strong parameters
  def year_params
    params.require(:year).permit(:year, :archived)
  end
end
