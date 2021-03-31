class UsersController < ApplicationController
  def index

  end

  def show
    @user = User.find(params[:id])
    @profile_image = current_user.profile_image
    @book = Book.new
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :introfuction, :profile_image)
  end

end
