module CreateTripsHelper
	def create_trips_transaction
		Trip.transaction do
			trips_params.each do |trip_params|
				Trip.create(trip_params)
			end
		end
		return true
		rescue Exception => ex
			return false
		end
	end
end