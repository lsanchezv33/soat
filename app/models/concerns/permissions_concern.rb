# frozen_string_literal: true

# Model Concerns
module PermissionsConcern
  extend ActiveSupport::Concern

  # Use to divide user email
  def set_alias
    email.split('@')[0].humanize
  end

  # Use to identify the session
  def session_admin?
    role == 'admin'
  end

  # use to return trade charge select info
  def basic_info
    "#{kind_class.humanize} - #{subtype.humanize}"
  end

  # use to return trade charge select info
  def upcase_plate
    self.license_plate = license_plate.mb_chars.upcase
  end

  # use to send user mail
  def send_notification(email, policy, vehicle)
    SoatMailer.purchase_summary(email, policy, vehicle).deliver
  end
end
