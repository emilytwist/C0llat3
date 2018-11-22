class StudiesController < ApplicationController
	load_and_authorize_resource

	def index
		@studies = Study.paginate(:page => params[:page], :per_page => 10).order :name
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	    @existing_study = Study.find_by(name: @study.name)

		if @existing_study
		  flash.now[:error] = %Q[This study already exists: <a href="/studies/#{@existing_study.id}">#{@study.name}</a>. Please either rename the study you are creating or view/edit the existing one.].html_safe
		  render 'new'
		elsif @study.save
		  redirect_to @study
		else
		  render 'new'
		end

	end

	def update

		if @study.update(study_params)
			redirect_to @study
		else
			render 'edit'
		end
	end

	def destroy
		@study.destroy

		redirect_to studies_path
	end

	private
		def study_params
			params.require(:study) .permit(:name, :description)
		end
end
