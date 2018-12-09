class PicturesController < ApplicationController

    def index
        user = User.find(params[:user_id])
        if user 
            pictures = user.pictures
            render json:pictures , status: 200
        end
    end

    def show
        user = User.find(params[:user_id])
        pictures = user.pictures.find(params[:id])
        render json: picture, status:200
    end

    def create
        user = User.find(params[:user_id])
        picture = user.pictures.new(params_picture)
        if picture.save 
            render json: picture, status:201
        else
            render json: picture.errors, status: :unprocessable_entity
        end
    end


    def destroy
        user = User.find(params[:user_id])
        picture = user.picture.find(params[:id])
        picture.destroy
        render json: picture, status: 200
    end

    def update
        user = User.find(params[:user_id])
        picture = user.picture.find(params[:id])
        if picture.update(params_product)
            render json: picture, status: 200
        else
            render json: picture.errors, status: 422
        end

    end

    def params_picture
        params.permit(:image, :imageName)
    end


end
