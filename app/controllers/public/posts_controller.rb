class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  # def search_result
  #   @range = params[:range]

  #   if @range == "User"
  #     @users = User.looks(params[:search], params[:word])
  #   else
  #     @posts = Post.looks(params[:search], params[:word])
  #   end
  # end

  def tag
    if params[:name].nil?
      @tags = Tag.all.to_a.group_by{ |tag| tag.posts.count}
    else
      name = params[:name]
      name = name.downcase
      @tag = Tag.find_by(tag_name: name)
      @post = @tag.posts
      @tags = Tag.all.to_a.group_by{ |tag| tag.posts.count}
    end
  end

  def new
    @post = Post.new
  end

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @user = User.find_by(id: @post.user_id)
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
    if @post.update(post_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit(:body, :tag_body, :lat, :lng, images: []).merge(user_id: current_user.id)
  end

  def is_matching_login_user
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      flash[:error] = 'ユーザーが存在しないか、アクセス権限がありません。'
      redirect_to posts_path
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
