class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    
    user = User.new(user_params)
    if user.save
     
      session[:session_token] = user.session_token
      redirect_to user_url(user)
    else
      # flash
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
