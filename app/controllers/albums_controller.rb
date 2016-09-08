class AlbumsController < ApplicationController

    before_action :ensure_log_in

  def new
    @band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    @band = Band.find(@album.band_id)

    if @album.save!
      render :index
    else
      flash.now[:errors] = ["Invalid album choices"]
      render :new
    end
  end

  def index
    @band = Band.find(params[:band_id])
    render :index
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)

    if @album.destroy!
      redirect_to band_url(@band)
    else
      flash.now[:errors] = ["Unable to process"]
      render :show
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])

    if @album.update!(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = ["Invalid Choices"]
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:name, :record_type, :band_id)
  end
end
