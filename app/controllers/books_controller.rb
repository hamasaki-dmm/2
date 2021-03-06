class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :proper_user_books, only: [:edit, :update, :destroy]

  def index
  	@new_book = Book.new
    @books = Book.all
  end

  def show
  	@new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
  end

  def create
  	@create_book = current_user.books.build(book_params)
  	if @create_book.save
      flash[:success] = "You have created book successfully"
  	  redirect_to book_path(@create_book)
    else
      @new_book = Book.new
      @books = Book.all
      render 'index'
    end
  end

  def update
    if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  def destroy
    user = @book.user
    @book.destroy
    flash[:success] = "You have destroyed book successfully."
    redirect_to books_path
  end


  private

  	def book_params
  		params.require(:book).permit(:title, :body)
  	end

    def proper_user_books
      @book = Book.find(params[:id])
      user = @book.user
      if current_user != user
        redirect_to books_path
      end
    end

end
