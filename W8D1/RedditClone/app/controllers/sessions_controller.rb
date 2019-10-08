class SessionsController < ApplicationController

  def new
  end

  def create
    username = params[:user][:username]
    password = params[:user][:password]
    @user = User.find_by_credentials(username, password)

    if @user
      log_in!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = 'Invalid username or password'
      render :new
    end
  end

  def destroy
    log_out!
  end
  
end
