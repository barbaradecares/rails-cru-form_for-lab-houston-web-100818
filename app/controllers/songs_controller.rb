class SongsController < ApplicationController
    before_action :define_current_song
    
    def index 
        @songs = Song.all
    end 

    def create 
        @song = Song.create(song_params)
        redirect_to song_path(@song)
    end 
    
    def update 
        @song.update(song_params)
        redirect_to song_path(@song)
    end 

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end 

    def define_current_song
        if params[:id]
            @song = Song.find(params[:id])
        else 
            @song = Song.new
        end 
    end 
end
