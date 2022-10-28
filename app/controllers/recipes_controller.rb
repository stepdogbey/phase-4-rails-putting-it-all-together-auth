class RecipesController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_error_response
    # before_action :authorize

    
    def index
        recipes = Recipe.all
        render json: recipes, status: :created
    end

    def create
        recipe = User.find_by(id: session[:user_id]).recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:user_id, :title, :instructions, :minutes_to_complete)
    end

    # def render_error_response(error_message)
    #     render json: { errors: error_message.record.errors.full_messages }, status: :unprocessable_entity
    # end

end
