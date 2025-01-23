class EntriesController < ApplicationController
  before_action :set_entry, only: [:update, :destroy]

  # GET /years/:year_id/entries
  def index
    @entries = Entry.where(date: Date.today.beginning_of_month..Date.today.end_of_month)
    render json: @entries
  end

  # POST /years/:year_id/entries
  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: @entry, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /years/:year_id/entries/:id
  def update
    if @entry.update(entry_params)
      render json: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /years/:year_id/entries/:id
  def destroy
    @entry.destroy
    head :no_content
  end

  private

  # Utilisé pour les actions update et destroy
  def set_entry
    @entry = Entry.find(params[:id])
  end

  # Strong parameters
  def entry_params
    params.require(:entry).permit(:amount, :entry_type, :subcategory_id, :date)
  end
end
