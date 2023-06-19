class RecipesController < ApplicationController

  before_action :only_signed_in

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @cookbook = current_user.cookbook
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @cookbook = current_user.cookbook
    if @recipe.save
      flash[:success] = "Your recipe has been register"
      redirect_to edit_recipe_path(@recipe)
    else
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @cookbook = @recipe.cookbook
    @instructions = @recipe.instructions
  end

  def update
    @recipe = Recipe.find(params[:id])
    @cookbook = @recipe.cookbook
    if @recipe.update(recipe_params)
      flash[:succes] = "Your recipe has been updated"
    else
      flash[:danger] = "An error has occured"
    end
    redirect_back fallback_location: recipe_path
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.delete
      flash[:success] = "The recipe has been deleted"
    else
      flash[:danger] = "Something wrong"
    end
    redirect_back fallback_location: recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(Recipe::PARAMS)
  end
end
