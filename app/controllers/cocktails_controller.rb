class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def edit
    get_cocktail
  end

  def update
    get_cocktail
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@coctail)
  end

  def show
    get_cocktail
  end

  def destroy
    get_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def get_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
