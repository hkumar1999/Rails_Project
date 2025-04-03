class Category < ApplicationRecord
    has_many :products, dependent: :destroy
  
    validates :name, presence: true
  
    # Required by Ransack (used by ActiveAdmin)
    def self.ransackable_attributes(auth_object = nil)
      ["id", "name", "created_at", "updated_at"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["products"]
    end
  end
  