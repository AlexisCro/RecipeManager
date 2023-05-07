class PasswordsController < ApplicationController

  skip_before_action :only_signed_in
  before_action :only_signed_out

  def new; end

  def create  
    user_params
    @user = User.find_by(mail: user_params[:email])
    if @user
      @user.regenerate_recover_password_token #method according by has_secure_token
      UserMailer.password(@user).deliver_now
      redirect_to new_session_path, success: 'an email sent you'
    else
      redirect_to new_password_path, danger: 'no user correspond'
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user.recover_password_token != params[:token].delete_prefix("3D")
      redirect_to new_password_path, danger: 'wrong token'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.recover_password_token == user_params[:recover_password_token]
      @user.assign_attributes(user_params.permit(:password, :password_confirmation))
      if @user.valid?
        @user.recover_password_token = nil
        @user.save
        session[:auth] = @user.to_session
        redirect_to profil_path, success: 'Your password has been reinitialized'
      end
    else
      redirect_to new_password_path, danger: 'wrong token'
    end
  end

  private

  def user_params
    params.require(:user)
  end
end
