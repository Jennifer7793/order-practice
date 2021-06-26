# frozen_string_literal: true

class ThirdPartyPayment < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :payment_types
  has_many :orders
  # has_many :order_summaries
  validates :withdraw_min, numericality: { greater_than_or_equal_to: 0.00, less_than_or_equal_to: :withdraw_max }
  validates :withdraw_fee, numericality: { greater_than_or_equal_to: 0.00 }
  enum currency: { CNY: 0, USDT: 1 }

  scope :active, -> { where(withdraw_status: true) }
  scope :under_limitations, ->(amount) { where('withdraw_max >= ? AND withdraw_min <= ?', amount, amount) }
  scope :depositable, -> { where(deposit_status: true) }
  scope :has_withdraw_service, -> { where(withdraw: true) }
  scope :platform_limitations, lambda {
    where(payment_types: { status: true })
      .select('third_party_payments.id, MAX(maximum) AS max, MIN(minimum) AS min')
      .group(:third_party_payment_id)
  }
end
