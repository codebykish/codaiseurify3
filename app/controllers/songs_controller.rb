class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def destroy
    @song = Song.find(params[:id])

    @song.destroy

    redirect_to songs_path
  end

  def create

    @song = Song.new(song_params)

    if @song.save
       redirect_to @song
    else
       render 'new'
    end
  end

    def update
    @song = Song.find(params[:id])

    if @song.update_attributes(song_params)
       redirect_to @song
    else
       render 'edit'
    end
  end

   private

   def song_params
    params.require(:song).permit(:song_name, :artist_id)
   end

end
