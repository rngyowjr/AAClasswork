class SessionsController < ApplicationController
  before_action :require_no_user!
  def new
    render :new # creating the login form / rendering login page - register (sign up) page
  end

  def create # actually logs in the person
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    
    if user
      login(user) #session[:session_token] = user.session_token #refactor to login(user)
      redirect_to cats_url
    else
      render json: ['no username / password'], status: 401
    end
  end

  def destroy #logs out from person
    current_user.reset_session_token! #giving them a new session token, invalidates the current token only if there is a current user
    #Invalidating the old token guarantees that no one can login with it. This is good practice in case someone has stolen the token. 
    #Just making sure that the old token is gone forever (before setting to nil)
    session[:session_token] = nil #setting session token to nil
    redirect_to new_session_url #login page
  end
end

# def current_user
#   return nil unless session[:session_token]  # unless session already ended / does not exist
#   @current_user ||= User.find_by(session_token: session[:session_token]) # finding the user by its session token
# end