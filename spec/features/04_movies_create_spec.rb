require "rails_helper"

feature "Create Movies" do
  context "As an authenticated user" do
    before do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )
      user_sign_in(user1)
    end

    movie1 = Movie.new(
      title: "Citizen Kane",
      studio: "Studio",
      year: 1940,
      rating: "R",
      genre: "Drama",
      cast_member: "Cast Member 1, Cast Member 2",
      director: "Director 1",
      screen_writer: "Screen Writer 1"
    )

    scenario "User sees a link Add new movie" do
      visit root_path
      expect(page).to have_content("Add New Movie")
    end

    scenario "User clicks link add new movie, is redirected to"\
      " new movie form, and sees all the required fields" do
      visit root_path
      click_link "Add New Movie"

      expect(page).to have_current_path(new_movie_path)
      expect(page).to have_content("Title")
      expect(page).to have_content("Studio")
      expect(page).to have_content("Year")
      expect(page).to have_content("Rating")
      expect(page).to have_content("Genre")
      expect(page).to have_content("Cast Member")
      expect(page).to have_content("Director")
      expect(page).to have_content("Screen Writer")
    end

    scenario "User is on the new movie form, fills in all the required"\
      " field correctly, and is redirected to the submitted movie show page" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_current_path(movie_path(Movie.all[0].id))
      expect(page).to have_content("You successfully added a movie")
      expect(page).to have_content("Citizen Kane")
      expect(page).to have_content("Studio")
      expect(page).to have_content(1940)
      expect(page).to have_content("R")
      expect(page).to have_content("Drama")
      expect(page).to have_content("Cast Member 1, Cast Member 2")
      expect(page).to have_content("Director 1")
      expect(page).to have_content("Screen Writer 1")
    end

    scenario "user is in new movie form, leaves title blank, and sees"\
      " a flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves studio blank, and sees"\
      " a flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Studio can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves year blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Year can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves rating blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Year", with: movie1.year
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Rating can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves genre blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Genre can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves cast blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Director", with: movie1.director
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Cast member can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves director blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Screen Writer", with: movie1.screen_writer
      click_button "Submit"

      expect(page).to have_content("Director can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves screen writer blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      click_link "Add New Movie"
      fill_in "Title", with: movie1.title
      fill_in "Studio", with: movie1.studio
      fill_in "Year", with: movie1.year
      fill_in "Rating", with: movie1.rating
      fill_in "Genre", with: movie1.genre
      fill_in "Cast Member", with: movie1.cast_member
      fill_in "Director", with: movie1.director
      click_button "Submit"

      expect(page).to have_content("Screen writer can't be blank")
      expect(page).to have_current_path(movies_path)
    end
  end
end
