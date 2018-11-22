class CategoriesController < ApplicationController
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
      if @category.save
        format.html { redirect_to categories_path, notice: 'Case study category was successfully created.' }
      else
        flash.now[:error] = "Category was not created"
        render 'new'
      end
    end
  end

def update
  @study = Study.all
  if @category.update(category_params)
    redirect_to @category
  else
    render 'edit'
  end
end

def add
  @category = Category.find(params[:category_id])
  @studies = Study.all.order :name

end

def destroy

	@category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Category was successfully deleted.' }
    end
end

private
	def category_params
		params.require(:category) .permit(:name, :description, study_ids: [])
	end

  def load_study
    @study = Study.find_by(params[:study_id])
  end

end
