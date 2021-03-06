class ArtworksController < ApplicationController
    # 1. https://localhost/users?id=kdkd
    # 2. /users/:user_id/artworks => {user_id: ... }
    def index
        # params = { user_id => 1 }
        # SELECT * FROM artworks WHERE artists.id = user_id
        render json: Artwork.find_by(artist_id: params[:user_id])
        #circle time solution
        if params[:user_id]
            render json: Artwork.artworks_for_user_id(params[:user_id])
        elsif params[:collection_id]
            render json: Artwork.artworks_for_collection_id(params[:collection_id])
        else
                render json: Artwork.all
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save!
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def show
        render json: Artwork.find_by(id: params[:id])
    end

    def update
        artwork = Artwork.find_by(id: params[:id])
        if Artwork.update(params[:id], artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end
    
    def destroy
        artwork = Artwork.find_by(id: params[:id])
        artwork.destroy
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end