class PostsController < ApplicationController

before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Post.all.order('created_at DESC')
    @posts_pagination = Post.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @post          = Post.new(post_params)
    @post_user = current_user
    if @post.save
      redirect_to post_path(@post.id), notice: "Post Created"
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order('created_at DESC')
    @favorite = @post.favorite_for(current_user)
    @tags  = @post.tags(params[:tag_ids])

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
    params.require(:post).permit(:asset, :title, :body, {tag_ids: []})
  end


end
