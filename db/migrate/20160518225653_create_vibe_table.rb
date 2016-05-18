class CreateVibeTable < ActiveRecord::Migration
  def change
    create_table :vibes do |t|
      t.string :label
      t.integer :num_votes
      t.integer :spot_id
      t.timestamps
    end
  end
end
