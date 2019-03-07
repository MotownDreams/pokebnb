class PhotosController < ApplicationController
  before_action :find_flat, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_photo, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @photo.update(params_photo)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to flat_path(@flat)
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def photo_params
    params.require(:photo).permit(:photo)
  end
end
