class ViveksController < ApplicationController
  skip_before_action :authenticate_dane, only: [:show, :index]
  def index
    @viveks = Vivek.order(created_at: :desc).page(params[:page])
  end

  def show
    @vivek = get_vivek
  end

  def new
    @vivek = get_vivek
  end

  def create
    @vivek = Vivek.new(vivek_params)
    @vivek.dane_id = session[:dane_id]
    @vivek.save!
    redirect_to root_path
  end

  def destroy
    @vivek = get_vivek

    if @vivek.destroy
      redirect_to :viveks_path
    else
      redirect_to :back
    end
  end

private
  def get_vivek
    Vivek.find(params.fetch(:id))
  end

  def vivek_params
    params.require(:vivek).permit(:body, :dane_id)
  end
end
