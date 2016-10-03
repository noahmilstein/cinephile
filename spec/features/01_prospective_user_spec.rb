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
# [] User cannot click on movie reviews/post new review if they are not signed in and should be prompted either sign up as a new user or sign in as an exisiting user.

feature "Prospective user" do
  context "as as prospective user" do
    user1 = User.new(first_name: "John", last_name: "Doe", username: "johndoe", email: "john@doe.com", password: "sixchr1",  newsletter: false)
    user2 = User.new(first_name: "Jane", last_name: "Doe", username: "janedoe", email: "jane@doe.com", password: "sixchr1",  newsletter: false)
    movie1 = Movie.create(title: "Citizen Kane", studio: "Studio", year: 1940, rating: "R", genre: "drama", cast: "Cast Member 1, Cast Member 2", director: "Director 1", screen_writer: "Screen Writer 1")

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
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_content("Welcome to Cinephile!")
      expect(page).to have_current_path(movies_path, url: true)
    end

    scenario "user fills in sign-up form correctly and sees flash message confirming signup"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_content("Signed up successfully.")
    end

    scenario "user leaves first name blank and sees flash message with error"
      visit "/new"
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("First name can't be blank")
    end

    scenario "user leaves last name blank and sees flash message with error"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Last name can't be blank")
    end

    scenario "user leaves username blank and sees flash message with error"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Username can't be blank")
    end

    scenario "user leaves email blank and sees flash message with error"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Username", :with => user1.username
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Email can't be blank")
    end

    scenario "user leaves Enter Password field blank and sees flash message with error"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Email", :with => user1.email
      fill_in "Username", :with => user1.username
      fill_in "Confirm Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Password can't be blank")
    end

    scenario "user leaves Confirm Password field blank and sees flash message with error"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Email", :with => user1.email
      fill_in "Username", :with => user1.username
      fill_in "Enter Password", :with => user1.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Password can't be blank")
    end

    scenario "user leaves newsletter field blank and sees flash message with error"
      visit "/new"
      fill_in "First Name", :with => user1.first_name
      fill_in "Last Name", :with => user1.last_name
      fill_in "Email", :with => user1.email
      fill_in "Username", :with => user1.username
      fill_in "Enter Password", :with => user1.password
      fill_in "Confirm Password", :with => user1.password
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Newsletter can't be blank")
    end

    scenario "user selects username that is taken and is prompted to choose another"
      visit "/new"
      fill_in "First Name", :with => user2.first_name
      fill_in "Last Name", :with => user2.last_name
      fill_in "Username", :with => user1.username
      fill_in "Email", :with => user2.email
      fill_in "Enter Password", :with => user2.password
      fill_in "Confirm Password", :with => user2.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Please choose another username.")
    end

    scenario "user inputs email that is already used and is prompted to choose another"
      visit "/new"
      fill_in "First Name", :with => user2.first_name
      fill_in "Last Name", :with => user2.last_name
      fill_in "Username", :with => user2.username
      fill_in "Email", :with => user1.email
      fill_in "Enter Password", :with => user2.password
      fill_in "Confirm Password", :with => user2.password
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Please choose another username.")
    end

    scenario "user inputs malformed password and is prompted to choose another"
      visit "/new"
      fill_in "First Name", :with => user2.first_name
      fill_in "Last Name", :with => user2.last_name
      fill_in "Username", :with => user2.username
      fill_in "Email", :with => user2.email
      fill_in "Enter Password", :with => "abc"
      fill_in "Confirm Password", :with => "abc"
      fill_in "Sign up for newsletter?", :with => false
      click_button "Submit"
      expect(page).to have_current_path(new_user_path, url: true)
      expect(page).to have_content("Please choose a password of at least 6 characters with at least one number and one letter.")
    end

    scenario "user attempts to navigate to movie show page/make a review and is redirected to homepage with message to sign in"
      visit "/movies"
      click_link (movie1.title)
      expect(page).to have_current_path(movies_path, url: true)
      expect(page).to have_content("Please sign in or sign up in order to view this movie and its reviews")
    end
  end
end
