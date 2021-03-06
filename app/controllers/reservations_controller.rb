class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :redeem]
  before_filter :authenticate_customer!, except: [:redeem], unless: :json_request?
  before_filter :authenticate_advertiser!, only: [:redeem]
  skip_before_filter :verify_authenticity_token, if: :json_request?
  acts_as_token_authentication_handler_for Customer, except: [:redeem]


  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = current_customer.reservations
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new
    @reservation.promotion = Promotion.find(params[:promotion_id])
    @reservation.customer = current_customer

    respond_to do |format|
      if @reservation.make_reservation!
        @reservations = current_customer.reservations
        format.html { redirect_to reservations_url, notice: 'Promotion reserved successfully.' }
        format.json { render json: {status: :ok, message: 'Promotion reserved successfully.'} }
      else
        format.html { redirect_to @reservation.promotion, flash: {errors: @reservation.errors.full_messages} }
        format.json { render json: {errors: @reservation.errors, status: :fail}.to_json }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    respond_to do |format|
      if @reservation.cancel!
        format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
        format.json { render json: {status: :ok}.to_json }
      else
        format.html { redirect_to reservations_url }
        format.json { render json: {errors: @reservation.errors, status: :fail}.to_json }
      end
    end
  end

  def redeem
    respond_to do |format|
      if @reservation.redeem!
        format.html { redirect_to my_reservations_url, notice: 'Reservation was redeemed successfully' }
        format.json { render json: {status: 'ok', message: 'Reservation was redeemed successfully'} }
      else
        format.html { redirect_to my_reservations_url, flash: {errors: @reservation.errors.full_messages} }
        format.json { render json: {status: 'fail', errors: @reservation.errors} }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reservation_params
    params.require(:reservation).permit(:promotion_id)
  end

  def json_request?
    request.format.json?
  end
end
