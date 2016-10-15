require "rails_helper"

feature "movie poster" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    user_sign_in(user)
  end

  scenario "user sees poster upload option on new movie form" do
    click_link "Add New Movie"

    expect(page).to have_content("Add Poster")
  end

  scenario "user uploads a movie poster via attachment" do
    movie = Movie.new(title: "movietitle", studio: "studio", year: "1000", rating: "G", genre: "genre", cast_member: "cast", director: "director", screen_writer: "screen writer")
    click_link "Add New Movie"

    fill_in "Title", with: movie.title
    fill_in "Studio", with: movie.studio
    fill_in "Year", with: movie.year
    fill_in "Genre", with: movie.genre
    fill_in "Cast", with: movie.cast_member
    fill_in "Director", with: movie.director
    fill_in "Rating", with: movie.rating
    fill_in "Screen Writer", with: movie.screen_writer
    attach_file "Add Poster", "#{Rails.root}/spec/support/images/2001.jpg"
    click_button "Submit"

    expect(page).to have_content(movie.title.capitalize)
    expect(page).to have_xpath("//img")
  end

  scenario "user uploads a movie poster via url link" do
    movie = Movie.new(title: "movietitle", studio: "studio", year: "1000", rating: "G", genre: "genre", cast_member: "cast", director: "director", screen_writer: "screen writer", poster: "http://www.filmsite.org/posters/cloc4.jpg")
    click_link "Add New Movie"

    fill_in "Title", with: movie.title
    fill_in "Studio", with: movie.studio
    fill_in "Year", with: movie.year
    fill_in "Genre", with: movie.genre
    fill_in "Cast", with: movie.cast_member
    fill_in "Director", with: movie.director
    fill_in "Rating", with: movie.rating
    fill_in "Screen Writer", with: movie.screen_writer
    fill_in "Or Poster URL", with: movie.poster
    click_button "Submit"

    expect(page).to have_content(movie.title.capitalize)
    expect(page).to have_xpath("//img")
  end
end
