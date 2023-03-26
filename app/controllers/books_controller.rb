class BooksController < ApplicationController
  def top
  end

  def new
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "Book was successfully created."
    else
      @books = Book.all
      @user = current_user

      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
    @book_comment = BookComment.new
    # if @user = current_user
    #   redirect_to book_path
    # end
  end

  def edit
    @book = Book.find(params[:id])
     if @book.user != current_user
       redirect_to books_path
     end
  end

   def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
    else
     @user = current_user
     @books = Book.all
     render :edit
    end
   end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

   def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
   end

end
