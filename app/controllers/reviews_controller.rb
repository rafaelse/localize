class ReviewsController < ApplicationController
  include RequestInfo
  before_action :set_reservation
  before_action :set_review, only: [:show, :edit, :update]
  before_action :authenticate_customer!, unless: :json_request?
  skip_before_action :verify_authenticity_token, if: :json_request?
  acts_as_token_authentication_handler_for Customer

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @reservation.reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    authorize_review_alteration!
    @review = @reservation.build_review(review_params)
    respond_to do |format|
      if @review.save!
        format.html {redirect_to reservations_url, notice: 'Avaliação cadastrada com sucesso!'}
        format.json {render json: {status: :ok, message: 'Avaliação cadastrada com sucesso!.'}}
      else
        format.html {render :new }
        format.json {render json: {errors: @review.errors, status: :fail}.to_json}
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    authorize_review_alteration!
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to reservations_url, notice: 'Avaliação atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  def set_reservation
    @reservation = Reservation.find(params[:reservation_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:reservation_id, :text, :rating)
  end
end
