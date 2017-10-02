class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new

  end

  def show
    get_cocktail
  end

  def create
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
