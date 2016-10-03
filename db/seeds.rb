# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# fields_to_insert = [ "DVD_Title", "Studio", "Rating", "Year", "Genre" ]
#
# rows_to_insert = []
#
# CSV.foreach("./db/movies.csv", headers:true) do |row|
#   row_to_insert = row.to_hash.select { |k,v| fields_to_insert.include?(k) }
#   rows_to_insert << row_to_insert
# end
#
# rows_to_insert.each do |movie|
#   Movie.create(title: movie["DVD_Title"], studio: movie["Studio"], year: movie["Year"], rating: movie["Rating"], genre: movie["Genre"])
# end
