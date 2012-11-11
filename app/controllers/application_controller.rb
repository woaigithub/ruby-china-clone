class ApplicationController < ActionController::Base
  protect_from_forgery


  helper_method :current_user, :signed_in?


  protected

  def sign_in(user)
    session[:user_id]=user.id 
    @current_user = user
  end

  def sign_out
    session[:user_id] = nil
    @current_user = nil
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def signed_in?
    current_user != nil
  end  


  
end
