class DanesController < ApplicationController
  def index
    @danes = Dane.page(params[:page])
  end

  def show
    @dane = get_dane
  end

  def new
    @dane = get_dane
  end

  def create
    @dane = Dane.create!(vivek_params)
    redirect_to @dane
  end

  def destroy
    @dane = get_dane

    if @dane.destroy
      redirect_to :danes_path
    else
      redirect_to :back
    end
  end

private
  def get_dane
    Dane.find(params.fetch(:id))
  end

  def dane_params
    params.require(:dane).permit(:username, :password, :password_confirmation, :first_name, :last_name, :bio)
  end
end
