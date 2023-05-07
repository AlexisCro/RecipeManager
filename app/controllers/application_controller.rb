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

  def only_signed_out
      redirect_to profil_path if user_signed_in?
  end

  def current_user
      return nil if !session[:auth] || !session[:auth]['id']
      return @current_user if @current_user
      @current_user =  User.find_by(id: session[:auth]['id'])
  end

  private

  def user_signed_in?
      !current_user.nil?
  end
end
