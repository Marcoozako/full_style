class RemoveContentBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :content
  end
end
