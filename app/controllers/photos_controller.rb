class PhotosController < ApplicationController
  before_action :find_flat, only: [:new, :create]

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.flat = @flat
    if @photo.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
