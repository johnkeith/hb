class Profile < ActiveRecord::Base
	belongs_to :user
	delegate :location, to: :user
end