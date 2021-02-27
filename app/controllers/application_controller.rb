class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :login_required
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end
end
