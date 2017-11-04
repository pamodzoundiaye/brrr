class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
      attributes = [:name, :adress, :cellnumber, :email, :profile, :password, :description, :cellNumber, :courtier]
      devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
      devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to  new_user_session_url }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
      puts "no sufficient privileges"
    end
end
