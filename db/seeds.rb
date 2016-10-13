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

various_users =[
  { first_name: "André", last_name: "Bazin", username: "cahiersducinéma", newsletter: true, email: "andre@gmail.com", password: "123456", admin: true },
  { first_name: "Roger", last_name: "Ebert", username: "AtTheMovies", email: "roger@suntimes.com", password: "123456", image: open("https://pbs.twimg.com/profile_images/451835991897026560/6QBIyJx6_400x400.jpeg") },
  { first_name: "Andrew", last_name: "Sarris", username: "TheAmericanCinema", newsletter: true, email: "auteurtheory@gmail.com", password: "123456" },
  { first_name: "Pauline", last_name: "Kael", username: "NewYorkerCritic", email: "pauline@yahoo.com", password: "123456", admin: true },
  { first_name: "A.O.", last_name: "Scott", username: "AO", newsletter: true, email: "ao@newyorktimes.com", password: "123456" }
]

various_users.each do |user|
  User.create(user)
end

various_movies =[
  { title: "Jurassic Park", studio: "Universal", year: "1993", rating: "PG-13", genre: "Action", cast_member: "Sam Neil, Laura Dern, Jeff Goldblum", director: "Steven Spielberg", screen_writer: "Michael Crichton", user_id: "4", poster: open("https://images-na.ssl-images-amazon.com/images/M/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE@._V1_.jpg") },
  { title: "Lost World", studio: "Universal", year: "1993", rating: "PG-13", genre: "Action", cast_member: "Sam Neil, Laura Dern, Jeff Goldblum", director: "Steven Spielberg", screen_writer: "Michael Crichton", user_id: "1", poster: open("https://images-na.ssl-images-amazon.com/images/I/51faTYC3rNL._AC_UL320_SR228,320_.jpg") }
]

various_movies.each do |movie|
  Movie.create(movie)
end

# create_table "movies", force: :cascade do |t|
#   t.string  "title",         null: false
#   t.string  "studio",        null: false
#   t.string  "year",          null: false
#   t.string  "rating",        null: false
#   t.string  "genre",         null: false
#   t.string  "cast_member",   null: false
#   t.string  "director",      null: false
#   t.string  "screen_writer", null: false
#   t.integer "user_id",       null: false
#   t.string  "poster"
#   t.index ["user_id"], name: "index_movies_on_user_id", using: :btree
# end
