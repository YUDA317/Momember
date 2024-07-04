class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user_id
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = @post.user_id
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if params[:post][:image_ids]
      params[:post][:image_ids].each do |image_id|
        image = post.images.find(image_id)
        image.purge
      end
    end
    if post.update_attributes(post_params)
      flash[:notice] = "編集しました。"
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除しました。"
    redirect_to '/posts'
  end

  private
  def post_params
    params.require(:post).permit(:body, :image, :address, :lat, :lng)
  end
end
