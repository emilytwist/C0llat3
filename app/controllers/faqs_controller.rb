class FaqsController < ApplicationController
  load_and_authorize_resource :nested => :product
  before_action :set_faq, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @product = Product.find(params[:product_id])
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @product = Product.find(params[:product_id])
  end

  # GET /notes/new
  def new
    @product = Product.find(params[:product_id])
    @faq = @product.faqs.new
  end

  # GET /notes/1/edit
  def edit    
    @product = Product.find(params[:product_id])
    @faq = @product.faqs.find(params[:id])
  end

  # POST /notes
  # POST /notes.json

  def create
    @product = Product.find(params[:product_id])
    @faq = @product.faqs.build(faq_params)

    respond_to do |format|
      if @faq.save
        format.html { redirect_to product_path(@product), notice: 'FAQ was successfully created.' }
      else
        flash.now[:error] = "FAQ was not created"
        render 'new'
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    @product = Product.find(params[:product_id])
    @FAQ = @product.faqs.find(params[:id])
    respond_to do |format|
      if @faq.update(note_params)
        format.html { redirect_to product_path(@product), notice: 'FAQ was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @product = Product.find(params[:product_id])
    @faq = @product.faqs.find(params[:id])
    @faq.destroy
    respond_to do |format|
      format.html { redirect_to product_path(@product), notice: 'FAQ was successfully deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      @faq = Faq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def faq_params
      params.require(:faq) .permit(:question, :answer, :product_id)
    end
end
