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

    end
end