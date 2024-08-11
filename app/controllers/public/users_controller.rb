class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    @posts = @user.posts
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end

  def destroy
    user = User.find(params[:id])
    user.posts.destroy_all
    user.destroy
    redirect_to "/"
  end

  private

  def user_params
    permitted = params.require(:user).permit(:email, :telephone_number, :password, :name, :account, :comment)
    permitted[:profile_image] = params[:user][:profile_image] if params[:user][:profile_image].present?
    permitted
  end

  def is_matching_login_user
    if user_signed_in?
      user = User.find_by(id: params[:id])
      unless user && user.id == current_user.id
        flash[:error] = 'ユーザーが存在しないか、アクセス権限がありません。'
        redirect_to posts_path
      end
    else
      flash[:error] = 'ログインが必要です。'
      redirect_to posts_path
    end
  end
end