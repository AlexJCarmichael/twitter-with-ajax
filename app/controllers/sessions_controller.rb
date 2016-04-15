class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def sign_in
  end

  def create
    dane = Dane.find_by(username: params[:username])


    if dane.present?
      if dane.authenticate(params[:password])
        session[:user_id] = dane.id
        flash.now[:notice] = "Successfully signed in!"
        redirect_to root_path
      else
        flash.now[:alert] = "Username and password did not match any records"
        render :sign_in
      end
    else
      flash.now[:alert] = "Username and password did not match any records"
      render :sign_in
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:notice] = "Signed out!"
    redirect_to root_path
  end

  def sign_out
  end
end
