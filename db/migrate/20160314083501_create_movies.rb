class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.text :plot
      t.integer :duration
      t.string :director
      t.references :actor
      t.string :genere
      t.string :trailer_url

      t.timestamps null: false
    end
  end
end
