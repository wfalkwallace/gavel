namespace :sidewalk_data do
	desc "This task will scrape and store sidewalk cafe data from a csv file from data.cityofnewyork.us"
	task :scrape_and_store => :environment do
		puts "starting to read in CSV"

		require 'csv'

		file = "db/DCA_Sidewalk_Cafes.csv"

		CSV.open(file, headers: true).each do |row|
			sc = SidewalkCafe.new
		    sc.dca_id = row[0].strip unless row[0].nil?
			sc.business_name = row[1].strip unless row[1].nil?
			sc.trade_name = row[2].strip unless row[2].nil?
			sc.sidewalk_cafe_type = row[3].strip unless row[3].nil?
			sc.license_number = row[4].strip unless row[4].nil?
			sc.full_address = row[5].strip unless row[5].nil?
			sc.address_building = row[6].strip unless row[6].nil?
			sc.address_street_name = row[7].strip unless row[7].nil?
			sc.city = row[8].strip unless row[8].nil?
			sc.state = row[9].strip unless row[9].nil?
			sc.zip_code = row[10].strip unless row[10].nil?
			sc.borough = row[11].strip unless row[11].nil?
			sc.address_location = row[12].strip unless row[12].nil?
			sc.phone = row[13].strip unless row[13].nil?
			sc.lic_area_sqft = row[14].strip unless row[14].nil?

			sc.save

			# puts row
		end

	end
end