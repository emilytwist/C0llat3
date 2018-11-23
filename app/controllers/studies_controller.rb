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
		@product = Product.all

		if @study.update(study_params)

			redirect_to @study
		else
			render 'edit'
		end
	end

	def add
  		@study = Study.find(params[:study_id])
  		@products = Product.all.order :product_code

	end

	def destroy
		@study.destroy

		redirect_to studies_path
	end

	private
		def study_params
		  params.require(:study) .permit(:name, :description, :banner, product_ids: [])
		end

		def load_product
		  @product = Product.find_by(params[:product_id])
		end

end
