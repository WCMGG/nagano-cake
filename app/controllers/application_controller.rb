class ApplicationController < ActionController::Base
  # flashメッセージ（Bootstrapで使えるように）
  add_flash_types :success, :info, :warning, :danger
  
  private
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Customer)
        customers_path
    else
        root_path
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

end
