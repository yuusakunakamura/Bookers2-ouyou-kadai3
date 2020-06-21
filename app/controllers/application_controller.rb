class ApplicationController < ActionController::Base
before_action :authenticate_user!
	def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end
   # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
   before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email]) #名前とメールでサインイン
  end
end
