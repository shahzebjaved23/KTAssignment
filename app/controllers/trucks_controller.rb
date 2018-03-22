class TrucksController < ApplicationController

	before_action :authenticate_with_token!

	def index
		@trucks = Truck.all
		render json: { trucks: @trucks }
	end
	
end