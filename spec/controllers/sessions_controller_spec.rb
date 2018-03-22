require "rails_helper"

RSpec.describe SessionsController do 

	it "creates a session for the user" do
		user = User.create(first_name: "firstname", last_name: "lastName", email: "some@email.com", password: "password")
		post :create, params: {
			user: {
				email: "some@email.com",
				password: "password"
			}
		}
		expect(response).to have_http_status(200)
	end

	it "returns an error for wrong email" do
		user = User.create(first_name: "firstname", last_name: "lastName", email: "some@email.com", password: "password")
		post :create, params: {
			user: {
				email: "some@email.co",
				password: "password"
			}
		}
		expect(response).to have_http_status(422)
	end

	it "returns and error for wrong password" do
		user = User.create(first_name: "firstname", last_name: "lastName", email: "some@email.com", password: "password")
		post :create, params: {
			user: {
				email: "some@email.com",
				password: "pass"
			}
		}
		expect(response).to have_http_status(422)
	end

end