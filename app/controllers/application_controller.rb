class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :build_index
	before_action :configure_permitted_parameters, if: :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to main_app.root_url, notice: exception.message }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
	end

	rescue_from ActionController::RoutingError do |exception|
		respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to main_app.root_url, notice: exception.message }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
	end

	def after_sign_in_path_for(user)
		products_path
	end

	def after_invite_path_for(resource)
		users_path
  	end

private

	def build_index
		if Group.exists?
			@groups = Group.all
		end
	end

protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:invitation, keys: [:first_name, :last_name, :company, :email, :distributor])
	  devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :company, :email, :distributor])
	end

end
