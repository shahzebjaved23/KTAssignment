namespace :user_admin do
	task :create => :environment do
		User.create(first_name: "firstName", last_name: "lastName", email: "some@email.com", password: "password", role: "admin")
		puts "Admin User Created - email: some@email.com , password: password"
	end
end


