class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :eltek, :distributor)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :eltek, :distributor)
  end
end