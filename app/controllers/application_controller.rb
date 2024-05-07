class ApplicationController < ActionController::Base

# before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path
  end

  def after_sign_out_path_for(resource)
    about_path
  end

 

  protected




  def after_sign_in_path_for(resource)
    about_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path

    when Customer
      root_path
    else
      root_path
    end
  end


end