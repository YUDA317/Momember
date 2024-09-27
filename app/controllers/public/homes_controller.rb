class Public::HomesController < ApplicationController
  before_action :authenticate_user!

  def top
    @user = User.find(current_user.id)
  end

  def about
  end
end
