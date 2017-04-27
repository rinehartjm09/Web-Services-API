module V1
  class PhotosController < ApplicationController
    before_action :set_photo, only: [:show, :update, :destroy]
    before_action :authenticate, only:[:create, :destroy]

    # GET /photos
    def index
      @photos = Photo.all

      render json: @photos, include: :gallery
    end

    # GET /photos/1
    def show
      render json: @photo, include: :gallery
    end

    # POST /photos
    def create
      @photo = Photo.new(photo_params)

      if @photo.save
        render json: @photo, status: :created, location: @photo
      else
        render json: @photo.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /photos/1
    def update
      if @photo.update(photo_params)
        render json: @photo
      else
        render json: @photo.errors, status: :unprocessable_entity
      end
    end

    # DELETE /photos/1
    def destroy
      @photo.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def photo_params
      params.require(:photo).permit(:title, :date_taken, :url, :gallery_id)
    end
  end
end
