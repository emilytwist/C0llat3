class ProductsController < ApplicationController
	load_and_authorize_resource

	def index
		@products = if params[:query]
	    Product.where('product_code LIKE ?', "%#{params[:query]}%")
	    render 'results'
	  else
		@products = Product.paginate(:page => params[:page], :per_page => 10).order :product_code
	  end
	end

	def show
		if current_user.last_viewed.present?
			@last_viewed = current_user.last_viewed
			@last_viewed.unshift(@product.id.to_s)
			@last_viewed.uniq!	
			current_user.last_viewed = @last_viewed[0..5]
		else 
			current_user.last_viewed.unshift(@product.id.to_s)
		end

		current_user.save!

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
			params.require(:product) .permit(:query, :product_code, :description, :options, :header_image, group_ids: [], uploads: [])
		end
end
