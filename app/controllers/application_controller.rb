class ApplicationController < ActionController::Base

    before_action :only_signed_in

    add_flash_types :success, :danger

    helper_method :current_user

    private

    def only_signed_in
        if !current_user
            redirect_to root_path, danger: "It seems you are not authorized"
        end
    end

    def current_user
        return nil if !session[:auth] || !session[:auth]['id']
        return @current_user if @current_user
        @current_user =  User.find_by(id: session[:auth]['id'])
    end
end
