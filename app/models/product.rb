class Product < ApplicationRecord
    belongs_to :category
    has_one_attached :image
  
    validates :name, :price, :stock_quantity, :category_id, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
  