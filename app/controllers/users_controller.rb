class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update]
  before_action :correct_user, only: [:edit, :destroy]

  def index
    @users = get_all_friends
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def logout
    @username = current_user.name
    sign_out(current_user)
  end

  def friend_request
    unless current_user.out_friend_requests.any?{ |fr| fr.target_id.to_i == params[:target_id].to_i }
      f = current_user.out_friend_requests.new
      f.target_id = params[:target_id]
      f.requester_id = current_user.id
      f.save
      flash[:alert] = 'request sent'
    else
      flash[:alert] = 'already requested'
    end
    redirect_to '/notifications'

  end

  def befriend
    f = FriendRequest.find(params[:friendship_id])
    if f.target == current_user && get_all_friends.none?(f.requester)
      friendship = current_user.friendships.new
      friendship.one = current_user
      friendship.other = f.requester
      friendship.save
      FriendRequest.find(params[:friendship_id]).destroy
    end
    redirect_to users_path
  end

  def notifications
    @sent_requests = current_user.out_friend_requests
    @incoming_requests = current_user.in_friend_requests
  end

  private
  
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def correct_user
      set_user
      unless current_user == @user
        redirect_to root_path
      end
    end

    def get_all_friends
      current_user.friendships.map{ |fr| fr.other }
    end
end
