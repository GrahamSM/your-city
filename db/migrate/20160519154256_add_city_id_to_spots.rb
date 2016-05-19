class AddCityIdToSpots < ActiveRecord::Migration
  def change
    add_column(:spots, :city_id, :integer)
  end
end
