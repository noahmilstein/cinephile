require 'rails_helper'

# As a prospective user
# I want to create an account
# So that I can post items and review them
#
# Accpetance Criteria
# [] User clicks sign up link and fills in the form for username, password, email, and neccessary fields for new user.
# [] User clicks sign up and fills in the form for email as username and password correctly and the rest of the form. User should be redirected to the home page with a message that welcomes them to the site "Welcome to Cinephile!".
# [] User clicks sign up and fills in the form incorrectly. User should be redirected to the same sign up page and be asked to fill in all the required fields with a message.
# [] User should be prompted to pick another username if its already exists in the new user form page with a message.
# [] User should be prompted to use another email if that email is already associated with an account.
# [] User should be prompted to choose a password that is six characters long with at least one number and one letter.
# [] User cannot click on movie reviews if they are not signed and should be prompted either sign up as a new user or sign in as an exisiting user.
# [] User cannot post items if they are not signed and should be prompted either sign up as a new user or sign in as an exisiting user.

feature "Prospective user" do
  context "as as prospective user" do
    let! (:user1) { FactoryGirl.create(:user) }

    scenario "sees sign up link" do
      visit "/"
      expect(page).to have_link("Sign Up")
    end

    scenario "click sign up link and see fields to complete for registration" do
      visit "/"
      click_link("Sign Up")
      expect(page).to have_content("First Name")
      expect(page).to have_content("Last Name")
      expect(page).to have_content("Username")
      expect(page).to have_content("Email")
      expect(page).to have_content("Enter Password")
      expect(page).to have_content("Confirm Password")
      expect(page).to have_content("Sign up for newsletter?")
    end

    scenario "user fills in sign-up form correctly and is redirected to the homepage"
      visit "/new"
      fill_in "First Name", :with => ""

  end
end
