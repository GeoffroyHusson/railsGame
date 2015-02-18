class Location < ActiveRecord::Base
	belongs_to :user
	belongs_to :tournoi
	validates_presence_of :address
	#geocoded_by :address
	after_validation :geocode  
end
