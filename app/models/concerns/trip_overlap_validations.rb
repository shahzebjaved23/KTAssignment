module TripOverlapValidations

	def self.included(base)
  		base.class_eval do

  			validate :starting_greater_than_ending, :validate_user_left_overlap, :validate_user_right_overlap, :validate_user_middle_overlap, :validate_user_outer_overlap, :validate_truck_left_overlap, :validate_truck_right_overlap, :validate_truck_middle_overlap, :validate_truck_outer_overlap

  			def starting_greater_than_ending
				if self.starting > self.ending
					errors.add(:starting, "cannot be greater than ending")
				end
			end

			# Validations for User Overlaps

			def validate_user_left_overlap
				overlap_trips = Trip.where.not(id: self.id).where(user_id: self.user_id).where("starting <= '#{self.starting}' AND ending >= '#{self.starting}' AND ending <= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have left overlap with other trips")
				end
			end

			def validate_user_right_overlap
				overlap_trips = Trip.where.not(id: self.id).where(user_id: self.user_id).where("starting >= '#{self.starting}' AND starting <= '#{self.ending}' AND ending >= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have right overlap with other trips")
				end
			end

			def validate_user_middle_overlap
				overlap_trips = Trip.where.not(id: self.id).where(user_id: self.user_id).where("starting >= '#{self.starting}' AND ending <= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have middle overlap with other trips")
				end
			end

			def validate_user_outer_overlap
				overlap_trips = Trip.where.not(id: self.id).where(user_id: self.user_id).where("starting <= '#{self.starting}' AND ending >= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have outer overlap with other trips")
				end
			end


			# Validations for Truck Overlaps

			def validate_truck_left_overlap
				overlap_trips = Trip.where.not(id: self.id).where(truck_id: self.truck_id).where("starting <= '#{self.starting}' AND ending >= '#{self.starting}' AND ending <= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have left overlap with other trips")
				end
			end

			def validate_truck_right_overlap
				overlap_trips = Trip.where.not(id: self.id).where(truck_id: self.truck_id).where("starting >= '#{self.starting}' AND starting <= '#{self.ending}' AND ending >= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have right overlap with other trips")
				end
			end

			def validate_truck_middle_overlap
				overlap_trips = Trip.where.not(id: self.id).where(truck_id: self.truck_id).where("starting >= '#{self.starting}' AND ending <= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have middle overlap with other trips")
				end
			end

			def validate_truck_outer_overlap
				overlap_trips = Trip.where.not(id: self.id).where(truck_id: self.truck_id).where("starting <= '#{self.starting}' AND ending >= '#{self.ending}'")

				if overlap_trips.count > 0
					errors.add(:user_id, "user can't have outer overlap with other trips")
				end
			end
  		end
  		
	end
end