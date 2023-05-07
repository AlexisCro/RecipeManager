class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:success] = "Your ingredient has been added"
      redirect_back fallback_location: recipe_ingredients_path
    else
      debugger
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: recipe_ingredients_path
    end
  end

  def edit;end

  def update;end

  def destroy
    @ingredient = Ingredient.find(params[:recipe_id])
    if @ingredient.delete
      flash[:success] = "Your ingredient has been deleted"
      redirect_back fallback_location: recipe_ingredients_path
    else
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: recipe_ingredients_path
    end 
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(Ingredient::PARAMS)
  end
end
