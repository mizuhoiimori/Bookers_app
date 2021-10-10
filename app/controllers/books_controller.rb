class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      flash[:notice] = "create error"
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    if @book.update(book_params)
       @book.save
      flash[:notice] = "Book was successfully updated."
      redirect_to action: :show
    else
      flash[:notice] = "update error"
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to action: :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
