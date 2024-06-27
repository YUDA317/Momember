class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  private
  def post_params
    params.require(:post).permit(:body, :image, :address)
  end
end
