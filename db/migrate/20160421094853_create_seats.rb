class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
    	t.references :theater
    	t.string :row
    	t.integer :number

      t.timestamps null: false
    end
  end
end
