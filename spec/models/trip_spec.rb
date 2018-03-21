require "rails_helper"

RSpec.describe Trip do

	it "cannot be created without a user" do
		truck = Truck.create(number: "2424ln2l42")
		trip = Trip.create(truck_id: truck.id, starting: DateTime.now,ending: DateTime.now, distance: 232)
		expect(trip.id).to be(nil)
	end

	it "cannot be created without a truck" do
		user = User.create(last_name: "lastname", email: "email@some.com", password: "password")
		trip = Trip.create(user_id: user.id, starting: DateTime.now,ending: DateTime.now, distance: 232)
		expect(trip.id).to be(nil)
	end

end