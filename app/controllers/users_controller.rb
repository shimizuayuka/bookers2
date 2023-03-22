class UsersController < ApplicationController
  def top
    flash[:notice] = "Welcome! You have signed up successfully."
  end
  
  def show
    flash[:notice] = "Signed in successfully."
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @users = User.all
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])
  if @user != current_user
    redirect_to user_path(current_user)
  end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path
    else
     render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end
  
end
