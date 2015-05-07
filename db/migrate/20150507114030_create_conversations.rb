class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
    	t.jsonb :content, null: false
    end

    add_index :conversations, :content, using: :gin
  end
end
