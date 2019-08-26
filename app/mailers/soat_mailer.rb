# frozen_string_literal: true

# SOAT mailer
class SoatMailer < ApplicationMailer
  # use for send mail of policy_payment
  def purchase_summary(email, policy_payment, vehicle)
    @policy = policy_payment
    @vehicle = vehicle
    @trade_charge = vehicle.trade_charge
    @email = email

    mail to: @email,
         subject: t('activerecord.models.policy_payment'),
         from: 'SOAT <no_reply@admin.com>'
  end
end
