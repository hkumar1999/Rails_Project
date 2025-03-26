class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :total_price, presence: true, numericality: true
  validates :status, inclusion: { in: %w(Pending Shipped Delivered Cancelled) }
end
