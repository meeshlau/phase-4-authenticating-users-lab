class SessionsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :user_not_found

    def create
        user = User.find_by(username: params[:username])
        session[:uid] ||= user.id
        session[:user_id] ||= user.id
        render json: user, status: :created
    end

    def destroy
        session.destroy
        head :no_content
    end

    private 
    
    def user_not_found
        render json: { error: "User not found!" }, status: :not_found
    end
    
end
