class Conversation < ActiveRecord::Base
	has_many :user_conversations

	def self.find_shared_conversations(user_id_one, user_id_two)
		shared_conversation_ids = UserConversation.where(user_id: [user_id_one, user_id_two])
			.pluck(:conversation_id).instance_eval { detect { |c| count(c) > 0 } }
		
		Conversation.where(id: shared_conversation_ids)
	end
end