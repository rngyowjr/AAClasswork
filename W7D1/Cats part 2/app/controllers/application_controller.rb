class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    return nil unless session[:session_token]  # unless session already ended / does not exist
    @current_user ||= User.find_by(session_token: session[:session_token]) # finding the user by its session token -- This line gives back a user object
  end

  def logged_in?
    !!current_user
  end

  def login(user)
    @current_user = user
    session[:session_token] = @current_user.reset_session_token!
  end

  private
    def require_no_user!
    redirect_to cats_url if current_user
  end
end
