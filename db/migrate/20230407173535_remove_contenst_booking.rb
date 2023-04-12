class RemoveContenstBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :content
    remove_column :bookings, :stars
  end
end
