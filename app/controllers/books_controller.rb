class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    # formからtitle,bodyのみ受付
    @book = Book.new(book_params)
    # もう一つのカラム user_idには現在のuser.idを入れる
    @book.user_id = current_user.id
    # その情報をsave
    @book.save
    redirect_to book_path(@book.id)
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
