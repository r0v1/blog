class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]

  def create
    comment_params  = params.require(:comment).permit(:body)
    @post           = Post.find params[:post_id]
    @comment        = Comment.new comment_params
    @comment.post_id   = params[:post_id]
    @comment_user   = current_user
    if @comment.save
      PostsMailer.notify_post_owner(@comment).deliver_now
      redirect_to post_path(@post), notice: "Comment created."
    else
      render "/posts/show"
    end
  end

  def destroy
    post = Post.find params[:post_id]
    @comment.destroy
    redirect_to post_path(post), notice: "Comment deleted."
  end

  private

  def find_comment
    @comment = Comment.find params[:id]
  end


end
