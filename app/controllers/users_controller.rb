class UsersController < ApplicationController
  before_filter :get_user, :only=>[:show,:edit,:update,:destroy,:user_login,:send_friend_request]
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #UserMailer.send_mail_on_user_create(@user).deliver
      flash[:notice] = "User created Succefully"
      redirect_to user_path(@user)
    else
      flash[:alert] = "unable to create user"
      render "new"
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "user successfully updated"
      redirect_to user_path
    else
      flash[:alert] = "unable to create"
      render "edit"
    end
       
  end

  def index
    @users = User.all
    
  end
#----------------------------------------------------------------------------------------------
  def friend_list
    @users = User.all
  end
  
  def send_friend_request
    @friend = FriendRequest.where(:user_id=>current_user.id,:friend_id=>@user.id,:status=>"friend request pending")
    if @friend.present?

      flash[:alert] = "request already sent"
      redirect_to :back
    else
      FriendRequest.create(:user_id=>current_user.id,:friend_id=>@user.id,:status=>"friend request pending")
      flash[:notice] = "friend request sent"
      redirect_to :back
    end
    
  end 

  def destroy
    @user.destroy
    flash[:notice] = "user is deleted"
    redirect_to users_path
  end
  def show_profile
    @user = User.find(params[:id])
    @friend = FriendRequest.where(:friend_id=>@user.id,:user_id=>current_user.id,:status=>"friend")

    #@friend = FriendRequest.where(:user_id=>current_user)    
  end
  def user_login
  end

  def friends
    @friends = FriendRequest.where(:user_id=>current_user,:status=>"friend")
    @user_friend = FriendRequest.where(:friend_id=>current_user,:status=>"friend")
  end
  # user_id = jisne request send ki , friend_id = jisko request send ki 
  def friend_request
    @friend_requests = FriendRequest.where(:friend_id=>current_user.id,:status=>"friend request pending")
  end

  def request_sent_to
    @request_sent_to = FriendRequest.where(:user_id=>current_user.id,:status=>"friend request pending")
  end

  def slam_book_sent_to
  end

  def accept_friend_request
    FriendRequest.update(params[:id],:status=>"friend")
    flash[:notice] = "friend request accepted"
    redirect_to :back
  end

  def reject_friend_request
    FriendRequest.update(:status=>"rejected")
    redirect_to :back
  end
  def unfriend
    @unfriend  = FriendRequest.where(:friend_id=>params[:id],:user_id=>current_user).update_all(:status=>"nil")       
    redirect_to controller: "users",action: "friend_list", :id=> current_user.id  
  end      

  def send_slam_book
    @friend = FriendRequest.find(params[:id])
    if @friend.slam_book_status == "send"
      flash[:notice] ="request already send"
      redirect_to :back
    else
      FriendRequest.update(params[:id],:slam_book_status=>"send")
      flash[:notice] = "slam book request send"
      redirect_to :back
    end
  end
  def slam_book_request
    @slam_book_request = FriendRequest.where(:friend_id=>current_user.id,:status=>"friend",:slam_book_status=>"send")
  end
  def fill_slam_book
  end
  def view_slam_book
    @book = Book.find_by(:friend_request_id=>params[:id])
    
  end
  def view_slam_book_user
    @slam_book_user = FriendRequest.where(:user_id=>current_user,:slam_book_status=>"fill")
  end

  def create_slambook
    Book.create(:friend_request_id=>params[:friend_id],:fname=>params[:fname],:lname=>params[:lname],:hobby=>params[:hobby])
    @user = FriendRequest.where(:user_id=>params[:friend_id],:friend_id=>current_user.id).update_all(:slam_book_status=>"fill") 
    #FriendRequest.update(,:slam_book_status=>"fill")
    redirect_to :back
  end

  def find_user
    @user = User.where("fname LIKE ?","%#{params[:search]}%")
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:image,:fname,:lname,:title,:gender,:mobile,:email,:password,:password_confirmation)
  end
end

