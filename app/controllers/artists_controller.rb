class ArtistsController < ApplicationController
    
    before_action :define_current_artist

    def index 
        @artists = Artist.all
    end 

    def create 
        @artist = Artist.create(artist_params)
        redirect_to artist_path(@artist)
    end 
    
    def update 
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end 

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end 

    def define_current_artist
        if params[:id]
            @artist = Artist.find(params[:id])
        else 
            @artist = Artist.new
        end 
    end 
end
