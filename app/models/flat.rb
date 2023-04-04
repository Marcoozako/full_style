class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :city, presence: true
  validates :address, presence: true
  validates :description, length: { minimum: 20, too_short: "20 caractères au minimum" }
  validates :gears, inclusion: { in: %w(cuisine salon chambre)}
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: :even
end
