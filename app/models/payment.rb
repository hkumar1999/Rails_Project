class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :order, optional: true
  belongs_to :appointment, optional: true

  validates :amount, presence: true, numericality: true
  validates :payment_method, inclusion: { in: ['Credit Card', 'PayPal', 'Bank Transfer'] }
  validates :payment_status, inclusion: { in: %w(Pending Completed Failed) }
end
