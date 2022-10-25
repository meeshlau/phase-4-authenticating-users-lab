class UsersController < ApplicationController


    def show
        current_user = User.find(session[:uid])
        current_user = User.find(session[:user_id])
        render json: current_user, sttus: :ok
    end
        
end
