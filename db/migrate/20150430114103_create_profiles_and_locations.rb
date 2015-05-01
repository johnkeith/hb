class CreateProfilesAndLocations < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.integer :user_id, null: false
      t.integer :age
      t.timestamps
    end

    create_table :locations do |t|
      t.string :city, null: false
      t.string :state
      t.string :country, null: false
      t.timestamps
    end
  end
end