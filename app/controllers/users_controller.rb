class UsersController < ApplicationController
  def top
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    
  end
  
  def edit
  end
  
end
