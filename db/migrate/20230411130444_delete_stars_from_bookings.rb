class DeleteStarsFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :stars
  end
end
