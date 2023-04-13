class ApplicationController < ActionController::Base

    before_action :only_signed_in

    add_flash_types :success, :danger

    private

    def only_signed_in
        if !session[:auth] || !session[:auth]['id']
            redirect_to root_path, danger: "It seems you are not authorized"
        end
    end
end
