class UserSessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user_session = UserSession.new(session_params)
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to friend_list_path
      #redirect_to controller: "users",action: "show", :id=> current_user.id
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_to new_user_sessions_path
  end
  
  def session_params
  	
    params.require(:user_session).permit(:email,:password)
  end
end
