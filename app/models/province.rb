class Province < ApplicationRecord
    # Associations
    has_many :users
    has_many :orders
  
    # Validations
    validates :name, presence: true, uniqueness: true
    validates :pst, :gst, :hst, numericality: { greater_than_or_equal_to: 0 }
  
  end
  