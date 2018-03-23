namespace :user_admin do
	task :create => :environment do
		company = Company.create(name: "company")
		User.create(first_name: "Admin", last_name: "User", email: "admin@email.com", password: "password", role: "admin", company_id: company.id)
		User.create(first_name: "Readonly", last_name: "User", email: "user@email.com", password: "password", company_id: company.id)
		
		puts "Admin User Created - email: admin@email.com , password: password"
		puts "Readonly User Created - email: user@email.com , password: password"
	end
end


