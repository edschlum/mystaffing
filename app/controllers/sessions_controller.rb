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
      session[:user_id] = user.id
      redirect_to saisie_url, :notice => "Bienvenue"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
