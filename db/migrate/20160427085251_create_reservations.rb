class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.references :show
    	t.references :seat
    	t.references :user

      t.timestamps null: false
    end
  end
end
