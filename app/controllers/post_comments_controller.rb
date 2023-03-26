class PostCommentsController < ApplicationController
  def create
    # @books=Book.find(params[:id])
    @books = Book.find(params[:book_id])
    @post_comment = PostComment.new
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = @books.id
    comment.save
    
    redirect_to book_path(@books)
  end

  def show
    @book = Book.find(params[:id])
    @post_comment = PostComment.new
    @user = current_user
    redirect_to request.referer
  end

  def destroy
    @book_comment = PostComment.find(params[:book_id])
    @book_comment.destroy
    redirect_to request.referer
    # redirect_to ("/posts/#{params[:post_id]}")
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
