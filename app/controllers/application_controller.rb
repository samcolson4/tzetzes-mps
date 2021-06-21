class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
  end

  private 

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to '/about', notice: "Please sign in or register to view that page." if request.original_fullpath != '/about'
    end
  end 

end
