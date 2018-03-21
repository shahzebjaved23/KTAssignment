require "rails_helper"

RSpec.describe User do
	it "created the user auth token on user creation" do
		user = User.create(first_name: "firstname", last_name: "lastname", email: "email")
		expect(user.auth_token.present?).to be(true)
	end

	it "cannot create a user without the first name" do
		user = User.create(last_name: "lastname", email: "email")
		expect(user.id.blank?).to be(true)
	end

	it "cannot create user without last name" do
		user = User.create(first_name: "firstname", email: "email")
		expect(user.id.blank?).to be(true)
	end

	it "cannot create user without email" do
		user = User.create(first_name: "firstname", last_name: "lastname")
		expect(user.id.blank?).to be(true)
	end
end