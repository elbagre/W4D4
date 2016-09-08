class NotesController < ApplicationController
  def new
    render :new
  end

  def create
    @note = Note.new(note_params)

    if @note.save!
      redirect_to track_url(@note.track_id)
    else
      flash.now[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end

  def show
    render :show
  end
end
