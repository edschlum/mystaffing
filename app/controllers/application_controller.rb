class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    end
  
  def require_login
    if cookies[:auth_token] == nil
      redirect_to log_in_url
    end
  end

  def has_comments?
   !self.comments.empty?   
  end
  
end
