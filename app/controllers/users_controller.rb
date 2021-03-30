class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introfuction, :profile_image_id)
  end

end
