class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        user_params = params.require(:user).permit %i[username mail firstname lastname password ]
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            UserMailer.confirm(@user).deliver_now
            redirect_to action: :new, success: t('register.mailer.confirm_message')
        else
            puts @user.valid?
            if @user.errors.any?
                @user.errors.full_messages.each { |error| puts error}
            end
            render 'new', danger: 'problem'
        end
    end

    def confirm
        @user = user.find(params[:id])
        if @user.confirmation_token == params[:token]
            @user.update(is_confirmed: true, confirmation_token: nil)
            @user.save(validates: false)
        else
            redirect_to new_user_path, danger: t('register.mailer.invalid_token')
        end
    end
end
