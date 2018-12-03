class WelcomeController < ApplicationController
	layout 'welcome'
	skip_before_action :authenticate_user!, :only => [:index]
  def index
  	if user_signed_in?
  		@products = Product.all

  	end
  end
end
