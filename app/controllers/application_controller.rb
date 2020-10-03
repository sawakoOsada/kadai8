class ApplicationController < ActionController::Base
  def authenticate_user
    unless logged_in?
      if @current_user == nil
        flash[:notice] = t('notice.login_needed')
        redirect_to new_session_path
      end
    end
  end

  def compare_user
    if @current_user.id != user.id
      redirect_to root_path
    end
  end

  protect_from_forgery with: :exception
  include SessionsHelper
end
