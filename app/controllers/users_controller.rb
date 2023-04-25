class UsersController < ApplicationController

    skip_before_action :only_signed_in, only: %i[new create confirm]
    before_action :only_signed_out, only: %i[new create confirm]

    def new
        @user = User.new
    end

    def create
        user_params = params.require(:user).permit %i[username mail firstname lastname password password_confirmation]
        @user = User.new(user_params)
        @user.recover_password = nil
        if @user.valid?
            @user.save
            UserMailer.confirm(@user).deliver_now
            redirect_to action: :new, success: t('mailer.confirm_message')
        else
            @user.errors.full_messages.each { |error| puts error }
            render action: :new, danger: @user.errors.full_messages
        end
    end

    def edit
        @user = current_user
    end

    def update
        @user = User.find(session[:auth]['id'])
        if @user.update(update_params)
            flash[:success] = t('edit.success')
            redirect_to profil_path
        else
            flash[:danger] = t('edit.danger')
            redirect_to profil_path
        end
    end

    def confirm
        @user = user.find(params[:id])
        if @user.confirmation_token == params[:token]
            @user.update(is_confirmed: true, confirmation_token: nil)
            @user.save(validates: false)
            session[:auth] = {id: @user.id}
            redirect_to profil_path
        else
            redirect_to new_user_path, danger: t('register.mailer.invalid_token')
        end
    end

    private

    def update_params
        params.require(:user)[:password].blank? ? params.require(:user).permit(:mail, :firstname, :lastname) : params.require(:user).permit(User::UPDATE_PARAMS)
    end
end
