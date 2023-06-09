class Flat < ApplicationRecord
  # default_scope order("#{self.flat}.item_name ASC")
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :city, presence: true
  validates :address, presence: true
  validates :description, length: { minimum: 20, too_short: "20 caractères au minimum" }
  validates :gears, inclusion: { in: %w(cuisine salon chambre)}
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: :even

  def unavailable_dates
    bookings.pluck(:begin_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
