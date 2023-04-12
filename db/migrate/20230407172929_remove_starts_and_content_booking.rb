class RemoveStartsAndContentBooking < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :starts, :stars
    remove_column :bookings, :content
  end
end
