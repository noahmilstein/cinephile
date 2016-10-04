require 'rails_helper'

# As an unauthenticated user
# I want to sign in
# So that I can post items and review them

# Accpetance Criteria
# [] Unauthenticated user visits the site and sees an option to log in.
# [] Unauthenticated user visits the site and clicks on the link to sign in.
# [] Unauthenticated user is directed to sign in page where the user can fill in username and password.
# [] Unauthenticated user correctly fills in the form for the sign in page and is redirected to the home page, so that you can post and review movie items.
# [] Unauthenticated user incorrectly fills in the form for the sign in page and is redirected to the sign in page where the site tells the user to try again because username is incorrect.
# [] Unauthenticated user correctly fills in the username, but types in incorrect password. The user is then redirected to the sign in page where the site tells the user to provide the correct password.
# [] Unauthenticated user signs in and clicks on a movie to make a review


feature "Unauthenticated user" do
  context "as as unauthenticated user" do
    user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: false)
    movie1 = Movie.create(title: "Citizen Kane", studio: "Studio", year: 1940, rating: "R", genre: "drama", cast: "Cast Member 1, Cast Member 2", director: "Director 1", screen_writer: "Screen Writer 1")

    scenario "sees sign in link" do
      visit "/"
      expect(page).to have_link("Sign In")
    end

    scenario "click sign in link and see fields to complete for registration" do
      visit "/"
      click_link("Sign In")
      expect(page).to have_content("Username")
      expect(page).to have_content("Password")
    end

    scenario "user fills in sign-in form correctly and is redirected to the homepage" do
      visit "/"
      click_link("Sign In")
      fill_in "Username", :with => user1.username
      fill_in "Password", :with => user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path(movies_path, url: true)
    end

    scenario "user fills in sign-in form correctly and sees flash message confirming signin" do
      visit "/"
      click_link("Sign In")
      fill_in "Username", :with => user1.username
      fill_in "Password", :with => user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path(movies_path, url: true)
      expect(page).to have_content("Signed in successfully!")
    end

    scenario "user fills in sign-in form incorrectly and sees flash message with error" do
      visit "/"
      click_link("Sign In")
      fill_in "Username", :with => "incorrect"
      fill_in "Password", :with => user1.password
      click_button "Sign In"
      expect(page).to have_current_path(new_user_session_path, url: true)
      expect(page).to have_content("Username invalid, Try again!")
    end

    scenario "user fills in sign-up form incorrectly and sees flash message with error" do
      visit "/"
      click_link("Sign In")
      fill_in "Username", :with => user1.username
      fill_in "Password", :with => "incorrect"
      click_button "Sign In"
      expect(page).to have_current_path(new_user_session_path, url: true) 
      expect(page).to have_content("Password invalid, Try again!")
    end

    scenario "user fills in sign-in form correctly, sees flash message confirming signin, and successfully clicks on a movie_link." do
      visit "/"
      click_link("Sign In")
      fill_in "Username", :with => user1.username
      fill_in "Password", :with => user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path(movies_path, url: true)
      expect(page).to have_content("Signed in successfully!")
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
