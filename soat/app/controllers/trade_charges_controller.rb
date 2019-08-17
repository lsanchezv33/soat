# frozen_string_literal: true

# Trade Charge Class
class TradeChargesController < ApplicationController
  before_action :set_trade_charge, only: [:show, :edit, :update]

  # GET /trade_charges
  def index
    @trade_charges = TradeCharge.all
  end

  # GET /trade_charges/1
  def show; end

  # GET /trade_charges/new
  def new
    @trade_charge = TradeCharge.new
  end

  # GET /trade_charges/1/edit
  def edit; end

  # POST /trade_charges
  def create
    @trade_charge = TradeCharge.new(trade_charge_params)

    respond_to do |format|
      if @trade_charge.save
        format.html { redirect_to @trade_charge, notice: 'Trade charge was successfully created.' }
        format.json { render :show, status: :created, location: @trade_charge }
      else
        format.html { render :new }
        format.json { render json: @trade_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trade_charges/1
  def update
    respond_to do |format|
      if @trade_charge.update(trade_charge_params)
        format.html { redirect_to @trade_charge, notice: 'Trade charge was successfully updated.' }
        format.json { render :show, status: :ok, location: @trade_charge }
      else
        format.html { render :edit }
        format.json { render json: @trade_charge.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trade_charge
    @trade_charge = TradeCharge.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trade_charge_params
    params.require(:trade_charge).permit(:kind_class, :subtype, :premium, :runt, :revenue)
  end
end
