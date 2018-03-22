require "rails_helper"

RSpec.describe Trip do

	it "cannot be created without a user" do
		truck = Truck.create(number: "2424ln2l42")
		trip = Trip.create(truck_id: truck.id, starting: DateTime.now,ending: DateTime.now, distance: 232)
		expect(trip.id).to be(nil)
	end

	it "cannot be created without a truck" do
		user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
		trip = Trip.create(user_id: user.id, starting: DateTime.now,ending: DateTime.now, distance: 232)
		expect(trip.id).to be(nil)
	end

	describe "Truck Overlap" do
		it "cannot have left overlap" do 
			truck = Truck.create(number: "2424ln2l42")
			truck2 = Truck.create(number: "2334343")

			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 2.days, ending: DateTime.now + 5.days, distance: 232)
			trip2 = Trip.create(user_id: user.id, truck_id: truck2.id, starting: DateTime.now - 5.days, ending: DateTime.now + 2.days)
		
			expect(trip2.id).to be(nil)
		end

		it "cannot have right overlap" do
			truck = Truck.create(number: "2424ln2l42")
			truck2 = Truck.create(number: "2334343")

			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 5.days, ending: DateTime.now + 2.days, distance: 232)
			trip2 = Trip.create(user_id: user.id, truck_id: truck2.id, starting: DateTime.now - 2.days, ending: DateTime.now + 5.days)
		
			expect(trip2.id).to be(nil)
		end

		it "cannot have middle overlap" do
			truck = Truck.create(number: "2424ln2l42")
			truck2 = Truck.create(number: "2334343")

			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 5.days, ending: DateTime.now + 5.days, distance: 232)
			trip2 = Trip.create(user_id: user.id, truck_id: truck2.id, starting: DateTime.now - 2.days, ending: DateTime.now + 2.days)
		
			expect(trip2.id).to be(nil)
		end

		it "cannot have outer overlap" do
			truck = Truck.create(number: "2424ln2l42")
			truck2 = Truck.create(number: "2334343")

			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 2.days, ending: DateTime.now + 2.days, distance: 232)
			trip2 = Trip.create(user_id: user.id, truck_id: truck2.id, starting: DateTime.now - 5.days, ending: DateTime.now + 5.days)
		
			expect(trip2.id).to be(nil)
		end
	end

	describe "User Overlap" do
		it "cannot have left overlap" do 
			truck = Truck.create(number: "2424ln2l42")
		
			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			user2 = User.create(first_name: "firstname",last_name: "lastname", email: "email2@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 2.days, ending: DateTime.now + 5.days, distance: 232)
			trip2 = Trip.create(user_id: user2.id, truck_id: truck.id, starting: DateTime.now - 5.days, ending: DateTime.now + 2.days, distance: 232)
		
			expect(trip2.id).to be(nil)
		end

		it "cannot have right overlap" do
			truck = Truck.create(number: "2424ln2l42")
		
			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			user2 = User.create(first_name: "firstname",last_name: "lastname", email: "email2@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 5.days, ending: DateTime.now + 2.days, distance: 232)
			trip2 = Trip.create(user_id: user2.id, truck_id: truck.id, starting: DateTime.now - 2.days, ending: DateTime.now + 5.day, distance: 232)
		
			expect(trip2.id).to be(nil)
		end

		it "cannot have middle overlap" do
			truck = Truck.create(number: "2424ln2l42")
		
			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			user2 = User.create(first_name: "firstname",last_name: "lastname", email: "email2@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 5.days, ending: DateTime.now + 5.days, distance: 232)
			trip2 = Trip.create(user_id: user2.id, truck_id: truck.id, starting: DateTime.now - 2.days, ending: DateTime.now + 2.days, distance: 232)
		
			expect(trip2.id).to be(nil)
		end

		it "cannot have outer overlap" do
			truck = Truck.create(number: "2424ln2l42")
		
			user = User.create(first_name: "firstname",last_name: "lastname", email: "email@some.com", password: "password")
			user2 = User.create(first_name: "firstname",last_name: "lastname", email: "email2@some.com", password: "password")
			
			trip = Trip.create(user_id: user.id, truck_id: truck.id, starting: DateTime.now - 2.days, ending: DateTime.now + 2.days, distance: 232)
			trip2 = Trip.create(user_id: user2.id, truck_id: truck.id, starting: DateTime.now - 5.days, ending: DateTime.now + 5.days, distance: 232)
		
			expect(trip2.id).to be(nil)
		end
	end

end