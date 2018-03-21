namespace :user_admin do
	task :create => :environment do
		User.create(first_name: "first_name", last_name: "last_name", email: "some@email.com", role: "admin", password: "password")
	end
end
