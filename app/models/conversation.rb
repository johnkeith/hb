class Conversation < ActiveRecord::Base
	has_many :user_conversations
end