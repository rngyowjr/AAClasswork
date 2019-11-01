class Api::SessionsController < ApplicationController
    def create
        @user = user.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )
        if @user 
            login(@user)
            # render "api/users/show"
        else
            render json: ["Your username or password is no bueno"], status: 401
        end
    end

    def destroy
        @user = current_user
        if @user
            logout!
            # render "api/users/show"
            render {}
        else
            render json: ["nobody here to logout"], status 404
        end
    end
end
