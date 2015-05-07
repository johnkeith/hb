class CreateUserConversations < ActiveRecord::Migration
  def change
    create_table :user_conversations do |t|
    	t.integer :conversation_id, null: false
    	t.integer :user_id, null: false
    end

    add_index :user_conversations, :conversation_id
    add_index :user_conversations, :user_id
  end
end
