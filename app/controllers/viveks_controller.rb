class ViveksController < ApplicationController
  skip_before_action :authenticate_dane, only: [:show, :index]
  def index
    @viveks = Vivek.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html do
        @viveks
      end
      format.json do
        render json: @viveks.to_json(methods: [:time, :dane_danish])
      end
    end
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
    if @vivek.save
      respond_to do |format|
        format.json do
          render json: { message: "Tweet posted!"}
        end
        format.html do
          redirect_to root_path
        end
      end
    end
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
