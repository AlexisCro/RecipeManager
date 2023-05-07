class CookbooksController < ApplicationController

  def new; end

  def index
    @cookbooks = Cookbook.all
  end

  def show
    @cookbook = Cookbook.find_by(params[:id])
  end

  def edit
    @cookbook = Cookbook.find_by(params[:id])
  end

  def update
    @cookbook = Cookbook.find_by(params[:id])
    if @cookbook.update(cookbook_params)
      flash[:success] = t('edit.success')
        redirect_to profil_path
    else
      flash[:danger] = t('edit.danger')
      redirect_back profil_path
    end
  end

  private

  def cookbook_params
    params.require(:cookbook).permit(Cookbook::PARAMS)
  end
end
