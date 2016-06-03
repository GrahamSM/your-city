class CreateTableSpotsUsers < ActiveRecord::Migration
  def change
    create_table :spotsusers do |t|
      t.integer :user_id
      t.integer :spot_id
    end
  end
end
