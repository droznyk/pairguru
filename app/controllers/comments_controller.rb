class CommentsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    @comment = movie.comments.new(comment_params)
    create_comment || handle_create_error
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
  
  def create_comment
    @comment.save
    flash[:notice] = "You've commented successfully!"
    redirect_to movie_path(params[:movie_id])
  end
  
  def handle_create_error
    flash[:errors] = @comment.errors.full_messages
    redirect_back(fallback_location: root_path)
  end
end
