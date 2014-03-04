namespace :sidewalk_data do
	desc "This task will scrape and store sidewalk cafe data from a csv file from data.cityofnewyork.us"
	task :scrape_and_store => :environment do
		puts "starting to read in CSV"

		require 'csv'

		file = "db/DCA_Sidewalk_Cafes.csv"

		CSV.open(file, headers: true).each do |row|
			sc = SidewalkCafe.new
		    sc.dca_id = row[0]
			sc.business_name = row[1]
			sc.trade_name = row[2]
			sc.sidewalk_cafe_type = row[3]
			sc.license_number = row[4]
			sc.full_address = row[5]
			sc.address_building = row[6]
			sc.address_street_name = row[7]
			sc.city = row[8]
			sc.state = row[9]
			sc.zip_code = row[10]
			sc.borough = row[11]
			sc.address_location = row[12]
			sc.phone = row[13]
			sc.lic_area_sqft = row[14]

			sc.save

			# puts row
		end

	end
end