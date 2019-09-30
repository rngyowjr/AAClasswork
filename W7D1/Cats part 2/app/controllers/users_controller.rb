



class UsersController < ApplicationController
  before_action :require_no_user!
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      login(@user) #session[:session_token] = @user.session_token # refactor this line with login(@user)
      redirect_to cats_url
    else
      render json: ["didn't meet requirements"], status: 412 # refactor with render :new (new.html.erb for error messages)
    end
  end

  def users_params
    params.require(:user).permit(:username, :password)
  end

end
