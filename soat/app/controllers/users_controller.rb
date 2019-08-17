# frozen_string_literal: true

# User Class
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index; end

  def show; end

  def destroy; end

  private

  # use to callbacks
  def set_user
    @user = User.find(params[:id])
  end
end
