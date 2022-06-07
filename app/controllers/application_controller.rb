class ApplicationController < ActionController::Base
    before_action :configure_sign_up_params, if: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_path, :alert => exception.message
    end

    def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address, :img, :skill, :category, :review])
    end

    def configure_permitted_parameters
        update_attrs = [:password, :password_confirmation, :current_password]
        devise_parameter_sanitizer.permit :account_update, keys: update_attrs
    end
end
