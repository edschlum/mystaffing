class SessionsController < ApplicationController
  skip_before_filter :require_login
  def new
    user = User.authenticate(params[:email], params[:password])
    if user
      redirect_to saisie_url, :notice => "Bienvenue"
    end
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to saisie_url, :notice => "Bienvenue !"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Logged out!"
  end
end
