class ConversationsController < ApplicationController
	def create
		referrer_params = get_referrer_params
		message_recipient_id = referrer_params[:id] if referrer_params[:controller] == 'profiles'

		unless message_recipient_id
			raise StandardError, 'Not finding message_recipient ID!'
		end

		content = Conversation.new_statement_template

		content[:statement][:first_name] 	= @current_user_profile.first_name
		content[:statement][:last_name] 	= @current_user_profile.last_name
		content[:statement][:user_id] 		= current_user.id
		content[:statement][:content] 		= params[:conversation_addition]

		content_as_json = [content].to_json

		conversation = Conversation.create(content: content_as_json)

		UserConversation.create([
			{ user_id: current_user.id, conversation_id: conversation.id },
			{ user_id: message_recipient_id, conversation_id: conversation.id }
		])

		redirect_to :back
	end

	def update
		ensure_current_user_matches_conversation(params[:conversation_id], current_user)

		conversation = Conversation.find(params[:conversation_id])

		content = Conversation.new_statement_template

		content[:statement][:first_name] 	= @current_user_profile.first_name
		content[:statement][:last_name] 	= @current_user_profile.last_name
		content[:statement][:user_id] 		= current_user.id
		content[:statement][:content] 		= params[:conversation_addition]

		combined_content = conversation.content << content

		conversation.update(content: combined_content)

		redirect_to :back
	end

	private

	def ensure_current_user_matches_conversation(convo_id, current_user=current_user)
		user_ids_from_conversation = UserConversation.where(conversation_id: convo_id)
			.pluck(:user_id)
		
		unless user_ids_from_conversation.include?(current_user.id)
			raise StandardError, 'Current User cannot contribute to this conversation!'
		end
	end
end