class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy, :reserve]
#  before_action :check_unlimited, only: [:create, :update]
  before_filter :create_categories_structure, :except => [:index, :show]
  before_filter :authenticate_advertiser!, except: [:index, :show]
  before_filter :authorize_promotion_alteration!, only: [:edit, :destroy]
 
  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.all
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions
  # POST /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)
    check_unlimited
    @promotion.advertiser = current_advertiser
    
    respond_to do |format|
      if @promotion.save
        format.html { redirect_to @promotion, notice: 'Promotion was successfully created.' }
        format.json { render :show, status: :created, location: @promotion }
      else
        format.html { render :new }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    @promotion.attributes = promotion_params
    check_unlimited
    respond_to do |format|
      if @promotion.save
        format.html { redirect_to @promotion, notice: 'Promotion was successfully updated.' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def check_unlimited
    @promotion.valid_to = nil if params[:unlimited_time]
    @promotion.quantity = -1 if params[:unlimited_quantity]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_promotion
    @promotion = Promotion.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def promotion_params
    params.require(:promotion).permit(:title, :description, :banner, :valid_from, :valid_to, :quantity, :category_id, :price)
  end
  
  def create_categories_structure
    @categories = []
    category_set = Category.where(parent_category: nil).order(:name)
    unless category_set.empty?
      @categories = categories_tree(Category.where(parent_category: nil).order(:name))
    end
    @categories
  end

  def categories_tree(categories)
    result = []
    categories.each do |category|
      result << [('&nbsp;' * category.depth).html_safe + category.name, category.id]
      result += categories_tree(category.subcategories.order(:name)) unless category.subcategories.blank?
    end
    result
  end
end
