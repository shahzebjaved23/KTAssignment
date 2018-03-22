require "rails_helper"

RSpec.describe Truck do
	it "cannot be created without a number" do
		truck = Truck.create(number: nil)
		expect(truck.id).to be(nil)
	end
end