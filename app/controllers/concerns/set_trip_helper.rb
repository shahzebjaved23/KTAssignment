module SetTripHelper

	private 

	def set_all_trips
		if params[:user_id].present? && params[:truck_id].present?
			set_trips_with_user_and_truck()
			
		elsif params[:user_id].present? && params[:truck_id].blank?
			set_trips_with_user()
			
		
		elsif params[:user_id].blank? && params[:truck_id].present?
			set_trips_with_trucks

		elsif params[:user_id].blank? && params[:truck_id].blank?
			set_general_trips
		end	
	end

	def set_trips_with_user_and_truck
		@trips = Trip.where(user_id: params[:user_id], truck_id: params[:truck_id]).where("(starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}') OR (starting >= '#{params[:starting]}' AND ending IS NULL)")
	end

	def set_trips_with_user
		@trips = Trip.where(user_id: params[:user_id]).where("(starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}') OR (starting >= '#{params[:starting]}' AND ending IS NULL)")
	end

	def set_trips_with_trucks
		@trips = Trip.where(truck_id: params[:truck_id]).where("(starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}') OR (starting >= '#{params[:starting]}' AND ending IS NULL)")
	end

	def set_general_trips
		@trips = Trip.where("(starting >= '#{params[:starting]}' AND ending <= '#{params[:ending]}') OR (starting >= '#{params[:starting]}' AND ending IS NULL)")
	end
end