class CreateJoinTableVibesSpots < ActiveRecord::Migration
  def change
    create_join_table :vibes, :spots do |t|
      t.index :vibe_id
      t.index :spot_id
    end
  end
end
