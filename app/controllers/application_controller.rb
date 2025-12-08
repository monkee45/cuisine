class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protect_from_forgery with: :exception

  helper_method :current_user

 def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 def require_user
     if current_user
         Rails.logger.info "MYINFO: require_user returning True"
         return true
     else
         Rails.logger.info "MYINFO: Logged in Usre is NOT a Current User"
    end

   redirect_to '/login' unless current_user
 end

 def require_editor
   redirect_to '/' unless current_user.editor?
 end

 def require_admin
   redirect_to '/' unless current_user.admin?
 end

end
