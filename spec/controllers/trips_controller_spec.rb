require "rails_helper"

RSpec.describe TripsController do

	describe "#index" do
		it "get the trips for user id" do
			user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", password: "password")
			sign_in(user)
			
			truck = Truck.create(number: "232323")

			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 1.day, ending: DateTime.now + 3.days, distance: 22423)
			trip2 = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now + 4.days, ending: DateTime.now + 7.days, distance: 22423)

			get :index, params: {
				starting: DateTime.now - 3.days,
				ending: DateTime.now + 2.days,
				user_id: user.id
			}

			res = JSON.parse(response.body)
			trip_ids = res["trips"].map{|t| t["id"]}
			expect(trip_ids).to match_array([trip.id])
		end

		it "gets the trips for truck id" do
			user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", password: "password")
			sign_in(user)
			
			truck = Truck.create(number: "232323")

			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 1.day, ending: DateTime.now + 3.days, distance: 22423)
			trip2 = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now + 4.days, ending: DateTime.now + 7.days, distance: 22423)

			get :index, params: {
				starting: DateTime.now - 3.days,
				ending: DateTime.now + 2.days,
				truck_id: truck.id
			}

			res = JSON.parse(response.body)
			trip_ids = res["trips"].map{|t| t["id"]}
			expect(trip_ids).to match_array([trip.id])
		end

		it "gets the trips for user id and truck id" do
			user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", password: "password")
			sign_in(user)
			
			truck = Truck.create(number: "232323")

			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 1.day, ending: DateTime.now + 3.days, distance: 22423)
			trip2 = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now + 4.days, ending: DateTime.now + 7.days, distance: 22423)

			get :index, params: {
				starting: DateTime.now - 3.days,
				ending: DateTime.now + 2.days,
				truck_id: truck.id
			}

			res = JSON.parse(response.body)
			trip_ids = res["trips"].map{|t| t["id"]}
			expect(trip_ids).to match_array([trip.id])
			
		end

		it "gets general trips" do
			user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", password: "password")
			sign_in(user)
			
			truck = Truck.create(number: "232323")

			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 1.day, ending: DateTime.now + 3.days, distance: 22423)
			trip2 = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now + 4.days, ending: DateTime.now + 7.days, distance: 22423)

			get :index, params: {
				starting: DateTime.now - 3.days,
				ending: DateTime.now + 2.days,
			}

			res = JSON.parse(response.body)
			trip_ids = res["trips"].map{|t| t["id"]}
			expect(trip_ids).to match_array([trip.id, trip2.id])
		end
	end

	describe "#create" do
		it "creates the trips in arrays" do
		end

		it "rolls back the transaction if any of the trips fail" do
		end
	end

	
end