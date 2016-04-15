class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  before_action :authenticate_dane

  def signed_in?
    session[:dane_id].present?
  end
  helper_method :signed_in?

  def current_dane
    return if session[:dane_id].nil?
    @current_dane ||= Dane.find(session[:dane_id])
  end
  helper_method :current_dane

  def authenticate_dane
    if session[:dane_id].nil?
      flash[:alert] = "Sign in to do this!"
      redirect_to sign_in_path
    end
  end

end
