class Order < ApplicationRecord
  include AASM
  serialize :raw_data
  serialize :raw_callback
  belongs_to :payment_type, optional: true
  belongs_to :third_party_payment, optional: true
  enum devise: { mobile: 0, pc: 1 }
  enum service_type: { deposit: 0, withdraw: 1 }
  validates :serial_number, uniqueness: true, allow_nil: true

  aasm column: :state do
    state :pending, initial: true
    state :submitted, :failed, :outtime, :revoked, :paid, :notified

    event :submit, before: :calculate_fee do
      transitions from: %i[pending outtime], to: :submitted
    end

    event :revert_submit do
      transitions from: :submitted, to: :pending
    end

    event :fail do
      transitions from: :pending, to: :failed
    end

    event :revert_fail do
      transitions from: :failed, to: :pending
    end

    event :overtime do
      transitions from: %i[pending submitted], to: :outtime
    end

    event :revoke do
      transitions from: %i[pending submitted outtime failed], to: :revoked
    end

    event :pay do
      transitions from: :submitted, to: :paid, if: :deposit?
      transitions from: :submitted, to: :paid
    end

    event :notify do
      transitions from: :paid, to: :notified
    end
  end
end
