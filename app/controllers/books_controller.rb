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
    if @book.save
      redirect_to book_path(@book.id), notice: "You have created book successfully."
    else
      @user = User.find(current_user.id)
      @books = Book.all
      render :index
    end
  end

  def index
    @user = User.find(current_user.id)
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.new
    @book_detail = Book.find(params[:id])
    @user = User.find(@book_detail.user_id)
  end

  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      @books = Book.all
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
