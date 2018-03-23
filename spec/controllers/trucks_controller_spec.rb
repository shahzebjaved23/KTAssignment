require "rails_helper"

RSpec.describe TrucksController do

	it "returns all the trucks" do
		company = Company.create(name: "some")
		user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", role: "admin", password: "password", company_id: company.id)
		sign_in(user)
		truck = Truck.create(number: "234l2n43l2k", company_id: company.id)
		get :index
		res = JSON.parse(response.body)
		ids_array = res["trucks"].map{|t| t["id"]} 
		expect(ids_array).to match_array([truck.id])
	end

end