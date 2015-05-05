class AddMoreInformationToProfiles < ActiveRecord::Migration
  def change
  	change_table :profiles do |t|
  		t.string 	:first_name
  		t.string 	:last_name
  		t.text 		:personal_description
  		t.text		:city_description
		end
  end
end
