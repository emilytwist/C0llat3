class WelcomeController < ApplicationController
	layout 'welcome'
	skip_before_action :authenticate_user!, :only => [:index]
  def index
  end
end
