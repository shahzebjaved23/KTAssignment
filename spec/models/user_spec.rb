require "rails_helper"

RSpec.describe User do
	let(:company) { Company.create(name: "some") }

	it "created the user auth token on user creation" do
		user = User.create(first_name: "firstname", last_name: "lastname", email: "email@some.com", password: "password", company_id: company.id)
		expect(user.auth_token.present?).to be(true)
	end

	it "cannot create a user without the first name" do
		user = User.create(last_name: "lastname", email: "email@some.com", password: "password", company_id: company.id)
		expect(user.id.blank?).to be(true)
	end

	it "cannot create user without last name" do
		user = User.create(first_name: "firstname", email: "email@some.com", password: "password", company_id: company.id)
		expect(user.id.blank?).to be(true)
	end

	it "cannot create user without email" do
		user = User.create(first_name: "firstname", last_name: "lastname", password: "password", company_id: company.id)
		expect(user.id.blank?).to be(true)
	end
end