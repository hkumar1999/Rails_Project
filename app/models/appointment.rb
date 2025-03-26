class Appointment < ApplicationRecord
  belongs_to :user

  validates :appointment_date, :service_type, :status, presence: true
  validates :service_type, inclusion: { in: %w(Grooming Veterinary) }
  validates :status, inclusion: { in: %w(Scheduled Completed Cancelled) }
end
