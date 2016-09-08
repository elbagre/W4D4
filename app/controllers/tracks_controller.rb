class TracksController < ApplicationController
  def new
    @album = Album.find(params[:album_id])
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save!
      redirect_to album_tracks_url(@track.album_id)
    else
      flash.now[:errors] = ["Invalid track criteria"]
      render :new
    end
  end

  def index
    @album = Album.find(params[:album_id])
    render :index
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def destroy
    @track = Track.find(params[:id])
    @album = Album.find(@track.album_id)

    if @track.destroy
      redirect_to album_tracks_url(@album)
    else
      flash.now[:errors] = @track.erorrs.full_messages
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])

    if @track.update!(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
    end
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :track_type, :lyrics)
  end
end
