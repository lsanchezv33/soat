# frozen_string_literal: true

# Vehicles class
class VehiclesController < ApplicationController
  before_action :set_user
  before_action :set_vehicle, only: [:show, :edit, :update]
  before_action :set_trade_charges, only: [:new, :edit, :create, :update]

  # GET /vehicles
  def index
    @vehicles = @user.vehicles.all
  end

  # GET /vehicles/1
  def show; end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit; end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = @user

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to user_vehicles_path(@user), notice: 'Vehicle was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to user_vehicles_path(@user), notice: 'Vehicle was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  # Use callbacks to share common setup
  def set_trade_charges
    @trade_charges = TradeCharge.all
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def vehicle_params
    params.require(:vehicle).permit(:license_plate, :age, :passenger_number, :car_cylinder, :tons, :user_id, :trade_charge_id)
  end
end
