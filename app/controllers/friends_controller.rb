class FriendsController < ApplicationController
  before_filter :get_friend, :only=>[:show,:edit,:update,:destroy]
  
  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user_id=current_user.id
    if @friend.save
      flash[:notice] = "friend created Succefully"
      redirect_to friend_path(@friend)
    else
      flash[:alert] = "unable to create friend"
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def update
    if @friend.update(friend_params)
      flash[:notice] = "friend successfully updated"
      redirect_to friend_path
    else
      flash[:alert] = "unable to create"
      render "edit"
    end
       
  end

  def index
    @friends = Friend.all
  end
  
  def destroy
    @friend.destroy
    flash[:notice] = "friend is deleted"
    redirect_to friends_path
  end
  

  private
  def get_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:image,:fname,:lname,:title,:gender,:mobile,:email)
  end
end
