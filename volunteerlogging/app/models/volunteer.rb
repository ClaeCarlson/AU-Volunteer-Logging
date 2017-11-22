class Volunteer < ApplicationRecord
	has_one :volunteer_description
	has_many :hours
end
