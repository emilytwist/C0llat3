class UploadsController < ApplicationController
  load_and_authorize_resource :nested => :product		

	def destroy
		@product = Product.find(params[:id])
		@upload = @product.uploads.find(params[:id])

		@upload.purge # or use purge_later

		redirect_back(fallback_location: products_path)
	end

end