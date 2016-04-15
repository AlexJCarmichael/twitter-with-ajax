class ViveksController < ApplicationController
  def index
    @viveks = Vivek.page(params[:page])
  end

  def show
    @vivek = get_vivek
  end

  def new
    @vivek = get_vivek
  end

  def create
    @vivek = Vivek.create!(vivek_params)
    redirect_to @vivek
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
