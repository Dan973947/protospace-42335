class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    root_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #追加する許可していいカラム
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:name, :profile, :occupation, :position]
    )
  end
end
