class ViveksController < ApplicationController
  def index
    @viveks = Vivek.page(params[:page])
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
