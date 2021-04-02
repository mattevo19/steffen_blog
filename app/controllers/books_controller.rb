class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  before_action :book_find, only: [ :show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:success] = "Object successfully created"
      redirect_to @book
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end

  def update
      if @book.update(book_params)
        flash[:success] = "Book was successfully updated"
        redirect_to @book
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    if @book.destroy
      flash[:success] = 'Book was successfully deleted.'
      redirect_to books_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to books_url
    end
  end
  
  private

  def book_find
    @book = Book.find(params[:id])
  end


  def book_params
    params.require(:book).permit(:title, :author, :summary, :notes, :rating)
  end  
end
