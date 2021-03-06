class TripsController < ApplicationController

	before_action :authenticate_with_token!
	before_action :set_current_company
	before_action :authenticate_admin_user, only: [:create]
	before_action :set_all_trips, only: [:index]
	before_action :trips_summary, only: [:summary]

	include SetTripHelper
	include CreateTripsHelper
	include TripsSummaryHelper


	def index
		if params[:starting].blank? || params[:ending].blank?
			render json: { message: "starting and ending time must be present"}, status: 400
		else
			render json: { trips: @trips }
		end
	end

	def create
		if create_trips_transaction
			render json: { message: "trips created successfully" }
		else
			render json: { message: "unable to create trips" }, status: 400
		end
	end

	def summary
		render json: { summary: @trips_summary }
	end

	private

	def trips_params
		params.permit(trips: [:user_id, :truck_id, :starting, :ending, :distance])
	end

end

