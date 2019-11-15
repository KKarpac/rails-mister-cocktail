class DosesController < ApplicationController
  before_action :set_dose, only: [:destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to root_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to root_path
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
