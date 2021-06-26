# frozen_string_literal: true

class PaymentType < ApplicationRecord
  belongs_to :third_party_payment
  has_many :orders
  enum category: { online: 0, qrcode: 1 }
  enum digital_bank: { general: 0, ALIPAY: 1, WebMM: 2, UNIPAY: 3 }
  validates :minimum, numericality: { greater_than_or_equal_to: 0.00, less_than_or_equal_to: :maximum }
  validates :fee, numericality: { greater_than_or_equal_to: 0.00 }

  scope :active, -> { where(status: true) }
  scope :inactive, -> { where(status: false) }
  scope :under_limitations, ->(amount) { where('maximum >= ? AND minimum <= ?', amount, amount) }
  scope :minimum_for_lower_limit, ->(category) { where(status: true, category: category).minimum(:minimum).to_f }
  scope :maximum_for_upper_limit, ->(category) { where(status: true, category: category).maximum(:maximum).to_f }

  def name_with_third_party_name
    "#{third_party_payment.name}：#{name}"
  end
end
