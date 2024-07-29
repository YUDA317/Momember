class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

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
    @user.update(user_params)
    redirect_to user_path(@user.id)
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
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to posts_path
    end
  end
end