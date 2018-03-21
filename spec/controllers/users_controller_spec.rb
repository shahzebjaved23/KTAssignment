require "rails_helper"

RSpec.describe UsersController do
	it "create a new user with the user role" do
		user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", role: "admin", password: "password")
		sign_in(user)

		post :create, params: {
			user: {
				first_name: "somefirstname",
				last_name: "somelastname",
				email: "someemail@email.com",
				password: "password"
			}
		}

		user2 = User.find_by(email: "someemail@email.com")
		expect(user2.role).to eq("user")
	end

	it "creates the new user with the admin role" do
		user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", role: "admin", password: "password")
		sign_in(user)

		post :create, params: {
			user: {
				first_name: "somefirstname",
				last_name: "somelastname",
				email: "someemail@email.com",
				password: "password",
				role: "admin"
			}
		}

		user2 = User.find_by(email: "someemail@email.com")
		expect(user2.role).to eq("admin")
	end

	it "only lets the admin users to create new users" do
		user = User.create(first_name: "firstname", last_name: "lastname", email: "some@email.com", password: "password")
		sign_in(user)

		post :create, params: {
			user: {
				first_name: "somefirstname",
				last_name: "somelastname",
				email: "someemail@email.com",
				password: "password"
			}
		}

		user2 = User.find_by(email: "someemail@email.com")
		expect(user2).to be(nil)
	end


end