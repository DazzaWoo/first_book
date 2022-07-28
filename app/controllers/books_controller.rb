class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  def new
    @book = Book.new
  end
  def show
    find_book
  end
  def create
    # render html: params[:book]
    # clean_params = params.require(:book).permit(:title, :content, :price)
    @book = Book.new(clean_params)

    if @book.save
      redirect_to books_path, notice: "Book created!"
    else 
       render :new
    end
  end

  def edit
    find_book
  end

  def update
    find_book
    if @book.update(clean_params)
      redirect_to books_path, notice: "Book updated!"
    else  
      render :edit
    end
  end
  def destroy
    find_book
    @book.destroy
    redirect_to books_path, notice: "Book destroied!"
  end

  private
  def clean_params
    params.require(:book).permit(:title, :content, :price)
  end
  def find_book
    @book = Book.find_by(id: params[:id])
  end
end
