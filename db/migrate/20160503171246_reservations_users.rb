class ReservationsUsers < ActiveRecord::Migration
  def change
    create_table :reservations_seats, id: false do |t|
      t.integer :reservation_id
      t.integer :seat_id
    end
 
    add_index :reservations_seats, :reservation_id
    add_index :reservations_seats, :seat_id
  end
end
