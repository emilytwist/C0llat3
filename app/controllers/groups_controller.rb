class GroupsController < ApplicationController
	load_and_authorize_resource

def index
end

def show
end

def new
end

def edit
end

def create

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_path, notice: 'Group was successfully created.' }
      else
        flash.now[:error] = "Group was not created"
        render 'new'
      end
    end
  end

def update
  @product = Product.find(params[:id])
	if @group.update(group_params)
		redirect_to @group
	else
		render 'edit'
	end
end

def add
  @group = Group.find(params[:group_id])
  @products = Product.all.order :product_code


end

def destroy

	@group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_path, notice: 'Group was successfully deleted.' }
    end
end

private
	def group_params
		params.require(:group) .permit(:name, :description, product_ids: [])
	end

  def load_product
    @product = Product.find_by(params[:product_id])
  end

end
