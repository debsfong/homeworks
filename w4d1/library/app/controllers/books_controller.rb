class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
  end

  def create
    Book.create(book_params)
    redirect_to books_url
  end

  def destroy
    Book.delete(params[:id])
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
