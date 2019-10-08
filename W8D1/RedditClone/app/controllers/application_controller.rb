class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?, :auth_token

  private
  def auth_token
    auth = '<input type="hidden" name="authenticity_token" value="form_authenticity_token">'
    auth.html_safe
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def log_in!(user)
    @current_user = user
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end
  
end
