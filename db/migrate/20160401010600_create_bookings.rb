class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :pax
      t.string :pickup
      t.string :destiny
      t.time :hour
      t.date :ondate

      t.timestamps null: false
    end
  end
end
