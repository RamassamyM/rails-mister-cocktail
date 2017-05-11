class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
    @dose = Dose.new
  end

  def show
    @doses = @cocktail.doses
    @ingredients = @cocktail.ingredients
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render 'new'
    end
  end

  def search
    @cocktails = Cocktail.where("name LIKE ?", "%#{search_params[:query]}%")
    @query = search_params
  end

  def byingredient
    @ingredient = Ingredient.find(ingredient_params[:ingredient_id])
    @cocktails = @ingredient.cocktails
  end

  private

    def search_params
      params.permit(:query)
    end

    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
    def ingredient_params
      params.require(:dose).permit(:ingredient_id)
    end
end
