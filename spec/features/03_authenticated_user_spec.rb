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
    user1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "abcdef1",  newsletter: false)

    scenario "user signs in and signs out" do
      viist "/"
      click_link("Sign In")
      fill_in "Username", :with => user1.username
      fill_in "Password", :with => user1.password
      click_button "Sign In"
      visit "/"
      click_link("Sign Out")
      expect(page).to have_content("You've signed out!")
    end

    scenario "user signs in, clicks on the link my account, and clicks on edit which redirects them to the user edit page" do
      visit "/"
      click_link("Sign In")
      fill_in "Username", :with => user1.username
      fill_in "Password", :with => user1.password
      click_button "Sign In"
      click_link "My Account"
      click_link "Edit"
      expect(page).to have_current_path(edit_user_path(user1.id), url: true)
    end

    scenario "user is on my user edit page, fills in the necessary changes, clicks save, and redirects to the home page with a success message" do
      visit "/user/{user1.id}/edit"
      click_link "My Account"
      click_link "Edit"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => "username123"
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      click_button "Save"
      expect(page).to have_content("You successfully edited your account!")
      expect(page).to have_current_path(movies_path, url: true)
    end

    scenario "user is on my user edit page, fills the username and password incorrectly which redirects them to the user edit page with an error message" do
      visit "/user/{user1.id}/edit"
      click_link "My Account"
      click_link "Edit"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => "username123"
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => ""
      fill_in "Confirm Password", :with => ""
      click_button "Save"
      expect(page).to have_content("Error, not a valid username and password!")
      expect(page).to have_current_path(edit_user_path(user1.id), url: true)
    end

    scenario "user is on my user edit page, fills the username incorrectly which redirects them to the user edit page with an error message" do
      visit "/user/{user1.id}/edit"
      click_link "My Account"
      click_link "Edit"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => ""
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      click_button "Save"
      expect(page).to have_content("Error, not a valid username!")
      expect(page).to have_current_path(edit_user_path(user1.id), url: true)
    end
    scenario "user is on my user edit page, fills the password incorrectly which redirects them to the user edit page with an error message" do
      visit "/user/{user1.id}/edit"
      click_link "My Account"
      click_link "Edit"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => ""
      fill_in "Confirm Password", :with => ""
      click_button "Save"
      expect(page).to have_content("Error, not a valid password!")
      expect(page).to have_current_path(edit_user_path(user1.id), url: true)
    end

    scenario "user is on my user edit page, fills the email incorrectly which redirects them to the user edit page with an error message" do
      visit "/user/{user1.id}/edit"
      click_link "My Account"
      click_link "Edit"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      click_button "Save"
      expect(page).to have_content("Error, not a valid email")
      expect(page).to have_current_path(edit_user_path(user1.id), url: true)
    end


    scenario "user in on my user edit page, clicks delete, and is redirected to the home page with a message saying that the user is deleted!"
      id = user1.id
      visit "/user/{user1.id}/edit"
      click_link "My Account"
      click_link "Edit"
      click_button "Delete"
      expect(page).to have_content("You successfully deleted your account!")
      expect(page).to have_current_path(movies_path, url: true)
      expect(User.find(id)).to_be eq([])
    end

  end
end
