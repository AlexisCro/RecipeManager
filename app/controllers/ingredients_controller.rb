class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @recipe = Recipe.find(params[:recipe_id])
    unless !(@ingredient.save)
      flash[:danger] = "Something wrong"
    end
    render turbo_stream: turbo_stream.replace('table_ingredients', partial: 'recipes/shared/table_ingredients', locals: { recipe: @recipe} )
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipe     = @ingredient.recipe
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    @recipe     = @ingredient.recipe
    if !@ingredient.update(ingredient_params)
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: recipe_ingredients_path
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
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
