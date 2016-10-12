require "rails_helper"

feature "Unauthenticated user" do
  context "as as unauthenticated user" do
    user1 = User.create(
      first_name: "John",
      last_name: "Doe",
      username: "johndoe",
      email: "john@doe.com",
      password: "abcdef1",
      newsletter: true
    )
    movie1 = Movie.create(
      title: "Citizen Kane",
      studio: "Studio",
      year: 1940,
      rating: "R",
      genre: "drama",
      cast_member: "Cast Member 1, Cast Member 2",
      director: "Director 1", screen_writer: "Screen Writer 1"
    )

    scenario "sees sign in link" do
      visit "/"
      expect(page).to have_link("Sign In")
    end

    scenario "click sign up link and see fields to complete form"\
    " registration" do
      visit "/"
      click_link("Sign In")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
    end

    scenario "user fills in sign-in form correctly and is"\
    " redirected to the homepage" do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path("/")
    end

    scenario "user fills in sign-in form correctly and sees flash "\
    "message confirming signin" do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path("/")
      expect(page).to have_content("Signed in successfully.")
    end

    scenario "user fills in sign-in form incorrectly and sees flash"\
    " message with error" do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: "incorrect"
      fill_in "Password", with: user1.password
      click_button "Sign In"
      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "user fills in sign-up form incorrectly and sees flash"\
    " message with error" do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: "incorrect"
      click_button "Sign In"
      expect(page).to have_current_path(new_user_session_path)
      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "user fills in sign-in form correctly, sees flash message"\
    " confirming signin, and successfully clicks on a movie_link." do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )
      movie1 = Movie.create(
        title: "Citizen Kane",
        studio: "Studio",
        year: 1940,
        rating: "R",
        genre: "drama",
        cast_member: "Cast Member 1, Cast Member 2",
        director: "Director 1",
        screen_writer: "Screen Writer 1"
      )
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path("/")
      expect(page).to have_content("Signed in successfully.")
      click_link("Citizen Kane")
      expect(page).to have_content("Citizen Kane")
      expect(page).to have_content("Studio")
      expect(page).to have_content(1940)
      expect(page).to have_content("R")
      expect(page).to have_content("drama")
      expect(page).to have_content("Cast Member 1, Cast Member 2")
      expect(page).to have_content("Director 1")
      expect(page).to have_content("Screen Writer 1")
    end
  end
end
