class UsersController < ApplicationController
  def picture
    current_user.photo = picture_params[:photo]
    current_user.save
    redirect_to edit_user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(update_params) ? (redirect_to root_path) : (render :edit)
  end

  private

  def update_params
    params.require(:user).permit(:first_name, :last_name, :pseudo, :photo)
  end

  def picture_params
    params.require(:user).permit(:photo)
  end
end
