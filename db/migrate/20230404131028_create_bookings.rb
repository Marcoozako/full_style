class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :begin_date
      t.date :end_date
      t.integer :number_of_guests
      t.text :content
      t.integer :starts
      t.references :user, null: false, foreign_key: true
      t.references :flat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
