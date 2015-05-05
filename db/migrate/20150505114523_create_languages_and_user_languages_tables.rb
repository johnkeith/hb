class CreateLanguagesAndUserLanguagesTables < ActiveRecord::Migration
  def change
    create_table :languages do |t|
    	t.string :name, null: false
    	t.timestamps
    end

  	# join table so that we don't have duplication on the languages table
    create_table :user_languages do |t|
    	t.integer :user_id, null: false
    	t.integer :language_id, null: false
    	t.timestamps
    end
  end
end
