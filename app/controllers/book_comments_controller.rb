class BookCommentsController < ApplicationController
  
  def create
    # @books=Book.find(params[:id])
    @books = Book.find(params[:book_id])
    @book_comment = BookComment.new
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = @books.id
    if comment.save
      redirect_to book_path(@books)
      flash[:notice] = "Comment was successfully created."
    else
      @error_comment = comment
      # @book_image = BookImage.find(params[:book_image_id])
      @book_comment = BookComment.new
      redirect_to request.referer
    end
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user = current_user
    redirect_to request.referer
  end

  def destroy
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    redirect_to request.referer
    # redirect_to ("/posts/#{params[:post_id]}")
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
  
end
