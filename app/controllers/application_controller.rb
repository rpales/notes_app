class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate_user!
    redirect_to new_user_session_path unless !current_user.nil?
  end
end
