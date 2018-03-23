module TripsSummaryHelper

	def trips_summary
		if params[:user_id].present?
			user_trips_summary
		elsif params[:truck_id].present?
			truck_trips_summary
		else
			render json: { message: "user or truck id must be present" }, status: 422 and return
		end
	end

	def user_trips_summary
		@trips_summary = {
			total_trips: Trip.where(user_id: params[:user_id]).where("starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}'").count,
			total_distance: Trip.where(user_id: params[:user_id]).where("starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}'").sum(:distance),
			user: User.find_by(id: params[:user_id])
		}
	end

	def truck_trips_summary
		@trips_summary = {
			total_trips: Trip.where(truck_id: params[:truck_id]).where("starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}'").count,
			total_distance: Trip.where(truck_id: params[:truck_id]).where("starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}'").sum(:distance),
			truck: Truck.find_by(id: params[:truck_id])
		}
	end

end