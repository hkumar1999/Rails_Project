class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :province

  has_many :order_items, dependent: :destroy

  validates :total_price, presence: true, numericality: true
end
