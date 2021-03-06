class DosesController < ApplicationController

  def new
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end
  end
  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

