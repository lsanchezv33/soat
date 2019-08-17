# frozen_string_literal: true

# Dashboard class
class DashboardController < ApplicationController
  def index; end

  # GET Customers
  def customers
    @customers = User.customers.include_vehicles
  end

  # GET policy payments
  def customer_policies
    @policies = PolicyPayment.all
  end
end
