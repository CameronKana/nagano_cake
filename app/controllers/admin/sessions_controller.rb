# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, only: [:create]


  def after_sign_in_path_for(resource)
    # サインイン後の遷移先を指定します
    # 例えば、管理者専用のダッシュボードページを指定する場合は、以下のようになります
    admin_root_path
  end

  def after_sign_out_path_for(resource)
    # サインアウト後の遷移先を指定します
    # 例えば、トップページにリダイレクトする場合は、以下のようになります
    admin_root_path
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end