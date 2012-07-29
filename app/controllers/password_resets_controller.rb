class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  
  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    redirect_to root_url, :notice => "Un e-mail vous a ete envoye pour renouveler votre mot de passe."
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Le delai de renouvellement de votre mot de passe a expire."
    elsif @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Votre mot de passe a ete renouvele !"
    else
      render :edit
    end
  end
end
