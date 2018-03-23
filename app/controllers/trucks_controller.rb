class TrucksController < ApplicationController

	before_action :authenticate_with_token!
	before_action :set_current_company

	def index
		@trucks = Truck.all
		render json: { trucks: @trucks }
	end
	
end