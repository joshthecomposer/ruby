class ApplicationController < ActionController::Base
    before_action :set_current_user
  
    helper_method :current_user, :user_signed_in?
  
    private
  
    def set_current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
  
    def current_user
      @current_user
    end
  
    def user_signed_in?
      current_user.present?
    end
  end
  
