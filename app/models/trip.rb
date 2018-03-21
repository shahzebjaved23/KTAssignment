class Trip < ApplicationRecord

	belongs_to :user
	belongs_to :truck

	validates_presence_of :starting

	validate :user_dosent_overlap,:truck_dosent_overlap

	def user_dosent_overlap
		users_other_trips = Trip.where(user_id: self.user_id) 
		overlap_trips = users_other_trips.where("starting <= '#{self.starting.utc.iso8601}' AND ending >= '#{self.ending.utc.iso8601}'").or(users_other_trips.where("starting <= '#{self.starting.utc.iso8601}' AND ending IS NULL"))

		if overlap_trips.count > 0
			errors.add(:user_id, "user can't overlap with other trips")
		end
	end

	def truck_dosent_overlap
		trucks_other_trips = Trip.where(truck_id: self.truck_id) 
		overlap_trips = trucks_other_trips.where("starting <= '#{self.starting.utc.iso8601}' AND ending >= '#{self.ending.utc.iso8601}'").or(trucks_other_trips.where("starting <= '#{self.starting.utc.iso8601}' AND ending IS NULL"))
		
		if overlap_trips.count > 0
			errors.add(:truck_id, "truck can't overlap with other trips")
		end
	end
end
