class RecipesController < ApplicationController

    before_action :require_user, only: [:show]
  # Only permit users with an editor role to access show and edit
    before_action :require_editor, only: [:update, :edit]
  # Only permit users with admin role to delete/destroy
    before_action :require_admin, only: [:destroy]

    def show
      @recipe = Recipe.find(params[:id])
    end

    def edit
      @recipe = Recipe.find(params[:id])
    end

    def update
      @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
          redirect_to @recipe
        else
          render 'edit'
        end
    end

    def destroy
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      redirect_to root_url
    end

    private
      def recipe_params
        params.require(:recipe).permit(:name, :ingredients, :instructions)
      end


end
