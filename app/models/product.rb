class Product < ApplicationRecord
    belongs_to :category
    has_one_attached :image
  
    # Validations
    validates :name, :price, :stock_quantity, :category_id, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

    belongs_to :category
    # Allow Ransack to search associations (needed by ActiveAdmin)
    def self.ransackable_associations(auth_object = nil)
      ["category", "image_attachment", "image_blob"]
    end
  
    # Allow Ransack to search/filter specific attributes
    def self.ransackable_attributes(auth_object = nil)
      ["name", "description", "price", "stock_quantity", "created_at", "updated_at"]
    end
  end
  