class UsersController < ApplicationController
  def show
    redirect_to edit_user_path(current_user)
    # @user = current_user
    # authorize @user
    # format.html { render 'users/edit' }
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    @user.update_without_password(user_params)
    redirect_to edit_user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:photo, :first_name, :last_name, :photo_cache)
  end
end
