class Conversation < ActiveRecord::Base
	has_many :user_conversations

	def self.find_shared_conversations(user_id_one, user_id_two)
		shared_conversation_ids = UserConversation.where(user_id: [user_id_one, user_id_two])
			.pluck(:conversation_id).instance_eval { detect { |c| count(c) > 1 } }

		Conversation.where(id: shared_conversation_ids)
	end

	def self.new_statement_template
		# a statement can contain an array of responses, which is filled with statements
		date_time = Time.now

		{ statement: 
			{
				first_name: '',
				last_name: '',
				user_id: '', # safe?
				user_profile_link: '', # safe?
				content: '',
				timestamp: date_time,
				responses: []
			}
		}
	end
end