class RecipesController < ApplicationController

  before_action :only_signed_in

  def index
    @recipes = Recipe.all
  end

  def show;end

  def new
    @recipe = Recipe.new
    @cookbook = current_user.cookbook
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @cookbook = current_user.cookbook
    if @recipe.save
      flash[:success] = "Your recipe has been register"
      render :edit
    else
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @cookbook = @recipe.cookbook
  end

  def update
    @recipe = Recipe.find(params[:id])
    @cookbook = @recipe.cookbook
    if @recipe.update(recipe_params)
      flash[:succes] = "Your recipe has been updated"
      redirect_back fallback_location: edit_recipe_path
    else
      flash[:danger] = "An error has occured"
      redirect_back fallback_location: edit_recipe_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.delete
      flash[:success] = "The recipe has been deleted"
      redirect_back fallback_location: recipes_path
    else
      flash[:danger] = "Something wrong"
      redirect_back fallback_location: recipes_path
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(Recipe::PARAMS)
  end
end