class Location < ActiveRecord::Base
	belongs_to :locatable, :polymorphic => true
	validates_presence_of :address
	geocoded_by :address
	after_validation :geocode 
	
end
