class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  before_filter :set_current_user

  protected # prevents method from being invoked by a route
  def enforce_login
    # we exploit the fact that the below query may return nil
    set_current_user
    redirect_to login_path and return unless @current_user
  end

  protected
  def enforce_login_instructor
    # we exploit the fact that the below query may return nil
    set_current_user
    redirect_to login_path flash[:notice]='Login as Instructor' and return unless @current_user && session[:usertype] == 'Instructor'
  end

  def set_current_user
    if session[:usertype] == 'Instructor'
    @current_user ||= Instructor.find_by_email session[:email]
    else
    @current_user ||= Student.find_by_email session[:email]
    end
  end
end