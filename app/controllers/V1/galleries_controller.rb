module V1
  class GalleriesController < ApplicationController
    before_action :set_gallery, only: [:show, :update, :destroy]

    # GET /galleries
    def index
      @galleries = Gallery.all

      render json: @galleries #, include: :photos
    end

    # GET /galleries/1
    def show
      render json: @gallery, include: :photos
    end

    # POST /galleries
    def create
      @gallery = Gallery.new(gallery_params)

      if @gallery.save
        render json: @gallery, status: :created, location: @gallery
      else
        render json: @gallery.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /galleries/1
    def update
      if @gallery.update(gallery_params)
        render json: @gallery
      else
        render json: @gallery.errors, status: :unprocessable_entity
      end
    end

    # DELETE /galleries/1
    def destroy
      @gallery.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gallery_params
      params.require(:gallery).permit(:title, :num_photos)
    end
  end
end
