require "rails_helper"

feature "Create Movies" do
  context "As an authenticated user" do
    let!(:user) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1") }
    let!(:movie) { FactoryGirl.create(:movie) }
    let!(:title) { "" }
    let!(:studio) { "" }
    let!(:year) { "" }
    let!(:rating) { "" }
    let!(:genre) { "" }
    let!(:cast_member) { "" }
    let!(:director) { "" }
    let!(:screen_writer) { "" }

    before do
      user_sign_in(user)
    end

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
      movie_fill(movie.title, movie.studio, movie.year, movie.rating, movie.genre, movie.cast_member, movie.director, movie.screen_writer)

      expect(page).to have_content("You successfully added a movie")
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.studio)
      expect(page).to have_content(movie.year)
      expect(page).to have_content(movie.rating)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(movie.cast_member)
      expect(page).to have_content(movie.director)
      expect(page).to have_content(movie.screen_writer)
      expect(page).to have_current_path(movie_path(2))
    end

    scenario "user is in new movie form, leaves title blank, and sees"\
      " a flash message with an error in the new movie form" do
      visit root_path
      movie_fill(title, movie.studio, movie.year, movie.rating, movie.genre, movie.cast_member, movie.director, movie.screen_writer)

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves studio blank, and sees"\
      " a flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, studio, movie.year, movie.rating, movie.genre, movie.cast_member, movie.director, movie.screen_writer)


      expect(page).to have_content("Studio can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves year blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, movie.studio, year, movie.rating, movie.genre, movie.cast_member, movie.director, movie.screen_writer)

      expect(page).to have_content("Year can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves rating blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, movie.studio, movie.year, rating, movie.genre, movie.cast_member, movie.director, movie.screen_writer)

      expect(page).to have_content("Rating can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves genre blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, movie.studio, movie.year, movie.rating, genre, movie.cast_member, movie.director, movie.screen_writer)

      expect(page).to have_content("Genre can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves cast blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, movie.studio, movie.year, movie.rating, movie.genre, cast_member, movie.director, movie.screen_writer)

      expect(page).to have_content("Cast member can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves director blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, movie.studio, movie.year, movie.rating, movie.genre, movie.cast_member, director, movie.screen_writer)

      expect(page).to have_content("Director can't be blank")
      expect(page).to have_current_path(movies_path)
    end

    scenario "user is in new movie form, leaves screen writer blank, and sees a"\
      " flash message with an error in the new movie form" do
      visit root_path
      movie_fill(movie.title, movie.studio, movie.year, movie.rating, movie.genre, movie.cast_member, movie.director, screen_writer)

      expect(page).to have_content("Screen writer can't be blank")
      expect(page).to have_current_path(movies_path)
    end
  end
end
