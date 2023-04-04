class Flat < ApplicationRecord
  belongs_to :user

  validates :city, presence: true
  validates :address, presence: true
  validates :description, length: { minimum: 20 }, message: "20 caractères au minimum"
  validates :gears, inclusion: { in: %w(cuisine salon chambre)}
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: :even
end
