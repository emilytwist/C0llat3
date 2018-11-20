class RegistrationsController < Devise::RegistrationsController

def after_sign_up_path_for(user)
	root_url
end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :eltek, :distributor, :first_name, :last_name, :company)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :company)
  end
end