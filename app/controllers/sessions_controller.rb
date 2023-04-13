class SessionsController < ApplicationController

    skip_before_action :only_signed_in, only: %i[new create] 

    def new
    end

    def create
        user_params = params.require(:user)
        @user = User.where(username: user_params[:username], is_confirmed: true).first
        if @user and @user.authenticate(user_params[:password])
            session[:auth] = @user.to_session
            redirect_to profil_path
        else
            redirect_to new_session_path, danger: 'Wrong username or password'
        end
    end

    def destroy
        
    end
end