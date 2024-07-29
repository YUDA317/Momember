class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    user = User.find(params[:user_id])
    current_user.follow(user)
    redirect_to request.referer
  end

  def destroy
    user = User.find(params[:user_id])
    current_user.unfollow(user)
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end


# <div class="container">
#   <div class="row">
#     <div class="mt-2">

#       <div class="col-2">
#         <h2>Follow Users</h2>
#           <% if @users.exists? %>
#             <%= render "/users/index", users: @users %>
#           <% else %>
#             <p>ユーザーはいません</p>
#           <% end %>
#       </div>

#       <div class="col-2">
#         <h2>Follower Users</h2>
#           <% if @users.exists? %>
#             <%= render "/users/index", users: @users %>
#           <% else %>
#             <p>ユーザーはいません</p>
#           <% end %>
#       </div>
#     </div>
#   </div>
# </div>