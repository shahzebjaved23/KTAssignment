module CreateTripsHelper
	def create_trips_transaction
		begin
			Trip.transaction do
				trips_params[:trips].each do |trip_params|
					trip = Trip.create!(trip_params)
				end
			end
			return true
		rescue Exception => ex
			return false
		end
	end
end