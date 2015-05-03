class AddIndexOnLocationsForUniqueness < ActiveRecord::Migration
  def change
  	add_index :locations, [:city, :state, :country], unique: true
  end
end
