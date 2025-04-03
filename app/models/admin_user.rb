class AdminUser < ApplicationRecord
  # If you're using Devise
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    %w[id email created_at updated_at]
  end
end
