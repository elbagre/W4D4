class BandsController < ApplicationController

  before_action :ensure_log_in

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save!
      redirect_to band_url(@band)
    else
      flash.now[:errors] = ["Band name has already been taken"]
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update!(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = ["Band name has already been taken"]
      render :edit
    end
  end

  def index
    render :index
  end


  private

  def band_params
    params.require(:band).permit(:name, :description)
  end
end
