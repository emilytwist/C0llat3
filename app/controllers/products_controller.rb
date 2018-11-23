class ProductsController < ApplicationController
	load_and_authorize_resource

	def index
		@products = Product.paginate(:page => params[:page], :per_page => 10).order :product_code
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
	    @existing_product = Product.find_by(product_code: @product.product_code)

		if @existing_product
		  flash.now[:error] = %Q[This product already exists: <a href="/products/#{@existing_product.id}">#{@product.product_code}</a>. Please either rename the product you are creating or view/edit the existing one.].html_safe
		  render 'new'
		elsif @product.save
		  redirect_to @product
		else
		  render 'new'
		end

	end

	def update

		if @product.update(product_params)
			redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
		@product.destroy

		redirect_to products_path
	end

	def remove
		@product = Product.find(params[:product_id])
		@upload = @product.uploads.find(params[:upload_id])
		@upload.purge

		redirect_to product_path(@product), notice: "Upload was successfully removed."
	end

	private
		def product_params
			params.require(:product) .permit(:product_code, :description, :options, :header_image, group_ids: [], uploads: [])
		end
end
