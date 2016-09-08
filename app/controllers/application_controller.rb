class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method(
    :log_in!,
    :logged_in?,
    :log_out!,
    :current_user,
    :ensure_log_in
  )

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_log_in
    unless logged_in?
      redirect_to new_session_url
    end
  end

end
