require 'rails_helper'

# As an authenticated user
# I want to sign out, so that no one else can post items or reviews on my behalf
# I want to update my information, so that I can keep my profile up to date
# I want to delete my account, so that my information is no longer retained by the app

# Acceptance Criteria
# [] User is already signed in, clicks on the link to sign out, and should be redirected to the homepage with a message "You've signed out!".
# [] User is already signed in, clicks onto "my account" link, redirected to the user show, and clicks edit account which redirects them to user edit route.
# [] User is on my user edit page, fills in the necessary changes, clicks the button "save" on the edit page, and is redirected to user show page with a message "You successfully edited your account!".
# [] User is on my user edit page, incorrectly fills in username and password, clicks the button "save" on the edit page, and is redirected to user edit page with a message "Error, not a valid username and password".
# [] User is on my user edit page, incorrectly fills in updated email address, clicks the button "save" on the edit page, and is redirected to user edit page with a message "Error, not a valid email".
# [] User is on my user edit page, clicks on delete my account, and is redirected back to the home page with a message "You successfully deleted your account!".

feature "Authenticated user" do
  context "as as Authenticated user" do

    scenario "user signs in and signs out" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      visit "/"
      click_link("Sign Out")
      expect(page).to have_content("Signed out successfully.")
    end

    scenario "user signs in, clicks on the link my account, and clicks on edit which redirects them to the user edit page" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      expect(page).to have_current_path(edit_user_registration_path)
    end

    scenario "user is on my user edit page, fills in the necessary changes, clicks save, and redirects to the home page with a success message" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: "username123"
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      fill_in "Current Password", with: user1.password
      click_button "Update"
      expect(page).to have_content("Your account has been updated successfully.")
      expect(page).to have_current_path("/")
    end

    scenario "user is on my user edit page, fills the username and password incorrectly which redirects them to the user edit page with an error message" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Username", with: ""
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: ""
      fill_in "Confirm Password", with: ""
      fill_in "Current Password", with: user1.password
      click_button "Update"
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "user is on my user edit page, fills the username incorrectly which redirects them to the user edit page with an error message" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Username", with: ""
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      fill_in "Current Password", with: user1.password
      click_button "Update"
      expect(page).to have_content("Username can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "user is on my user edit page, fills the password incorrectly which redirects them to the user edit page with an error message" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: ""
      fill_in "Confirm Password", with: ""
      fill_in "Current Password", with: user1.password
      click_button "Update"
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_current_path(users_path)
    end

    scenario "user is on my user edit page, fills the email incorrectly which redirects them to the user edit page with an error message" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: ""
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      fill_in "Current Password", with: user1.password
      click_button "Update"
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_current_path(users_path)
    end
    scenario "user in on my user edit page, clicks delete, and is redirected to the home page with a message saying that the user is deleted!" do
      user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: true)
      id = user1.id
      visit "/"
      click_link("Sign In")
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      click_link "Edit registration"
      click_button "Cancel my account"
      expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
      expect(page).to have_current_path("/")
      expect { User.find(id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
