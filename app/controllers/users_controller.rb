class UsersController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :introfuction, :profile_image_id)
  end

end
