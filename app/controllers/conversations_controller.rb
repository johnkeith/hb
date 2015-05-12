class ConversationsController < ApplicationController
	before_action :get_user_profile, only: [:create]

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
	end
end