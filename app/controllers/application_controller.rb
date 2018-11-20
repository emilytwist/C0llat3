class ApplicationController < ActionController::Base
	before_action :authenticate_user!
	before_action :build_index

	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
	      format.json { head :forbidden, content_type: 'text/html' }
	      format.html { redirect_to main_app.root_url, notice: exception.message }
	      format.js   { head :forbidden, content_type: 'text/html' }
	    end
	end

	def after_sign_in_path_for(user)
		products_path
	end

private

	def build_index
		if Group.exists?
			@groups = Group.all
		end
	end

end
