class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :location, through: :user

	def full_name
		first_name && last_name ? "#{first_name} #{last_name}" : nil
	end
end