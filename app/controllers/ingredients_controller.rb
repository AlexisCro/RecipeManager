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
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: recipe_ingredients_path
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:recipe_id])
    @recipe     = @ingredient.recipe
  end

  def update
    @ingredient = Ingredient.find(params[:recipe_id])
    @recipe     = @ingredient.recipe
    if @ingredient.update(ingredient_params)
      flash[:success] = "Ingredient updated"
    else
      flash[:danger] = "Something wrong"
    end
    redirect_back fallback_location: recipe_ingredients_path
  end

  def destroy
    @ingredient = Ingredient.find(params[:recipe_id])
    if @ingredient.delete
      flash[:success] = "Your ingredient has been deleted"
    else
      flash[:danger] = "Something wrong"
    end 
    redirect_back fallback_location: recipe_ingredients_path
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(Ingredient::PARAMS)
  end
end
