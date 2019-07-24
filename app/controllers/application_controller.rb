
class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user! 
  protect_from_forgery with: :exception
  


  
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:name,:birth_date,:first_name,:last_name,:kana_first_name,:kana_last_name])
  end
  


  private
  def production?
    Rails.env.production?
  end

 
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.Application.credentials.BASIC_AUTH_USER && Rails.Application.credentials.BASIC_AUTH_PASSWORD == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
