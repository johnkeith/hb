class Location < ActiveRecord::Base
	has_many :users

	nilify_blanks
end