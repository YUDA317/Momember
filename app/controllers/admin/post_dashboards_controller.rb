class Admin::PostDashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
    @posts = Post.page(params[:page])
  end
end
