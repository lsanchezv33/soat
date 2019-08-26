# frozen_string_literal: true

# Policy Payments class
class PolicyPaymentsController < ApplicationController
  before_action :set_vehicle
  before_action :set_policy_payment, only: [:show, :edit, :update]

  # GET /policy_payments
  def index
    @policy_payments = @vehicle.policy_payments.all
  end

  # GET /policy_payments/1
  def show; end

  # GET /policy_payments/new
  def new
    @policy_payment = PolicyPayment.new
  end

  # GET /policy_payments/1/edit
  def edit; end

  # POST /policy_payments
  def create
    times = Time.parse(params[:times])
    @policy_payment = PolicyPayment.new(policy_payment_params)
    @policy_payment.expiration_date = @policy_payment.expiration_date.change(
      hour: times.strftime('%H'), min: times.strftime('%M')
    )

    respond_to do |format|
      if @policy_payment.save
        new_vehicle_payment(@policy_payment, @vehicle)

        format.html { redirect_to vehicle_policy_payments_path(@vehicle), notice: 'Policy payment was successfully created.' }
        format.json { render :show, status: :created, location: @policy_payment }
      else
        format.html { render :new }
        format.json { render json: @policy_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /policy_payments/1
  def update
    respond_to do |format|
      if @policy_payment.update(policy_payment_params)
        format.html { redirect_to vehicle_policy_payments_path(@vehicle), notice: 'Policy payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @policy_payment }
      else
        format.html { render :edit }
        format.json { render json: @policy_payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_policy_payment
    @policy_payment = PolicyPayment.find(params[:id])
  end

  # Use callbacks to share common setup
  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  # use to create new vehicle_payment record
  def new_vehicle_payment(policy, vehicle)
    current_user.send_notification(current_user.email, policy, vehicle)
    VehiclePayment.create(vehicle_id: vehicle.id, policy_payment_id: policy.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def policy_payment_params
    params.require(:policy_payment).permit(:card_number, :cardholder, :expiration_date, :secure_code, :quotes)
  end
end
