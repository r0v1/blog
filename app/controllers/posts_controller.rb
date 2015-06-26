class PostsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

  def index
    @current_time = Time.now
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post_params = params.require(:post).permit([:title, :body])
    @post          = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: "Post Created"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "Post Updated"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: "Post Deleted"
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    # This uses Strong Paramters feature of Rails where you must explicit by
    # default about what parameters you'd like to allow for your record
    # in this case we only want the user to enter teh title and the body
    params.require(:post).permit([:title, :body])
  end


end
