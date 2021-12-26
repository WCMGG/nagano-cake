class ApplicationController < ActionController::Base
  # flashメッセージ（Bootstrapで使えるように）
  add_flash_types :success, :info, :warning, :danger
  # before_action :configure_sign_up_params, only: [:create], if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  def after_sign_up_path_for(resource)
    case resource
    when Admin
      admin_customers_path
    when Customer
      customers_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_customers_path
    when Customer
      customers_path
    end
  end



protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :phone_number])
  end

end
