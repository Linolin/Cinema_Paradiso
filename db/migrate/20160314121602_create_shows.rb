class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
    	t.datetime :datetime
    	t.references :movie
    	t.references :theater
    	t.float :price

      t.timestamps null: false
    end
  end
end
