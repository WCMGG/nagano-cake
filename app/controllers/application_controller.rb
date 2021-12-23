class ApplicationController < ActionController::Base
  # flashメッセージ（Bootstrapで使えるように）
  add_flash_types :success, :info, :warning, :danger

end
