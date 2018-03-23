require "rails_helper"

RSpec.describe Truck do
	it "cannot be created without a number" do
		company = Company.create(name: "some")
		truck = Truck.create(number: nil, company_id: company.id)
		expect(truck.id).to be(nil)
	end
end