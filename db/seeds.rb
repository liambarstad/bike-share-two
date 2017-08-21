require './app/models/station'
require './app/models/city'
require 'CSV'
require 'pry'

CSV.foreach('./db/csv/station.csv', :headers => true, :encoding => 'ISO-8859-1') do |row|
  #We may need to review this portion of the code. How does this join the city object to the Station table?
  
  city = City.find_or_create_by(city: row["city"])

  Station.create(name: row["name"],
                 dock_count: row["dock_count"],
                 installation_date: row["installation_date"],
                 city_id: city.id
                 )
end
