namespace :sidewalk_data do
	desc "This task will scrape and store sidewalk cafe data from a csv file from data.cityofnewyork.us"
	task :scrape_and_store do
		puts "starting to read in CSV"

		require 'csv'

		file = "db/DCA_Sidewalk_Cafes.csv"

		CSV.open(file) do |row|
			puts row
		end

	end
end