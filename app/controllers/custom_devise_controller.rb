# class CustomDeviseController < ApplicationController
# end

class CustomDeviseController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    # サインイン後の遷移先を指定します
    # 例えば、管理者専用のダッシュボードページを指定する場合は、以下のようになります
    admin_dashboard_path
  end

  def after_sign_out_path_for(resource)
    # サインアウト後の遷移先を指定します
    # 例えば、トップページにリダイレクトする場合は、以下のようになります
    root_path
  end
end
