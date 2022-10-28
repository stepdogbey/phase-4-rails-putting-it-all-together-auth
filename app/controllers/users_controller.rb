class UsersController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :render_error_response
    skip_before_action :authorize, only: :create

    def create
         user = User.create!(user_params)
         session[:user_id] = user.id
         render json: user, status: :created
        #  else
        #     render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        #  end

    end

    def show
        user = User.find_by(id: session[:user_id])
        render json: user
    end

     private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    # def render_error_response(error_message)
    #     render json: { errors: error_message.record.errors.full_messages }, status: :unprocessable_entity
    # end

   
end
