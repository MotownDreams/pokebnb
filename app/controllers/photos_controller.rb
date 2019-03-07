class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_photo, only: [:edit, :update, :destroy]

  def new
    @photo = Photo.new
    authorize @photo
  end

  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.flat = @flat
    if @photo.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    authorize @photo
  end

  def update
    authorize @photo
    if @photo.update(params_photo)
      redirect_to flat_path(@flat)
    else
      render :edit
    end
  end

  def destroy
    authorize @photo
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
