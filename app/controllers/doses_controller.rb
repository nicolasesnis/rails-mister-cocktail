class DosesController < ApplicationController

  def new
    get_cocktail
    @dose = Dose.new
  end

  def create
    @dose = Dose.new({params[:dose][:description]})
    @dose.cocktail = get_cocktail
    @dose.ingredient = params[:dose][:ingredient]
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render :new
    end
    fail
  end

  private

  def get_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end
end
