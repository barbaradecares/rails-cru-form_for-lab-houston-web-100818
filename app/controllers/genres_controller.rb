class GenresController < ApplicationController

    before_action :define_current_genre

    def index 
        @genres = Genre.all
    end 

    def create 
        @genre = Genre.create(genre_params)
        redirect_to genre_path(@genre)
    end 
    
    def update 
        @genre.update(genre_params)
        redirect_to genre_path(@genre)
    end 

    def genre_params
        params.require(:genre).permit(:name)
    end 

    def define_current_genre
        if params[:id]
            @genre = Genre.find(params[:id])
        else 
            @genre = Genre.new
        end 
    end 
end
