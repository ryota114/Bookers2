class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    # 指定userが投稿したbookのみをbooksに入れる
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
