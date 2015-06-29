class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, :unless => :json_request?
  
 
  helper_method :current_user

   def json_request?
    request.format.json? || request.format.js?
  end

private

def current_user_session
  return @current_user_session if defined?(@current_user_session)
  @current_user_session = UserSession.find
end

def current_user
  return @current_user if defined?(@current_user)
   @current_user = current_user_session && current_user_session.user
end

def require_user
    unless current_user
      #store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_sessions_path
      return false
    end
  end
end
