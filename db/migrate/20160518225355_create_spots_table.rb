class CreateSpotsTable < ActiveRecord::Migration
  def change
    #TODO: Specific attribute to use with Google Maps?
    create_table :spots do |t|
      t.string :description
      t.string :location
      t.string :title
      t.integer :num_votes
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
