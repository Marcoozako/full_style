class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat

  validates :begin_date, :end_date, presence: true
  validate :end_date_after_begin_date
end
