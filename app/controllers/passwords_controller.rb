class PasswordsController < ApplicationController

    skip_before_action :only_signed_in
    before_action :only_signed_out

    def new
    end

    def create  
        user_params = params.require(:user)
        @user = User.find_by_email(user_params[:email])
        if @user
          @user.regenerate_recover_password_token #method according by has_secure_token
          UserMailer.password(@user).deliver_now
          redirect_to new_session_path, success: 'an email sent you'
        else
          redirect_to new_password_path, danger: 'no user correspond'
        end
    end

    def edit
    end

    def update
    end
end