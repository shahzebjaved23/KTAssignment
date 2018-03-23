namespace :generate_archive do
	task :create => :environment do
		Trip.where("created_at <= '#{DateTime.now - 6.months}'").each do |trip|
			write_to_archive(trip)
		end
	end
end

def write_to_archive(trip)
	# Writes the trip to archive
end
