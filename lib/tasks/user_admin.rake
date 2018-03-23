namespace :user_admin do
	task :create => :environment do
		company = Company.create(name: "company")
		User.create(first_name: "firstName", last_name: "lastName", email: "some@email.com", password: "password", role: "admin", company_id: company.id)
		puts "Admin User Created - email: some@email.com , password: password"
	end
end


