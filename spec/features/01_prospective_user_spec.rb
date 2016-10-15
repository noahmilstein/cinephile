require "rails_helper"

feature "Prospective user" do
  let!(:first_name) {""}
  let!(:last_name) {""}
  let!(:username) {""}
  let!(:email) {""}
  let!(:enter_password) {""}
  let!(:confirm_password) {""}
  let!(:user_first_name) {"emma"}
  let!(:user_last_name) {"watson"}
  let!(:user_username) {"emmawatson"}
  let!(:user_email) {"emmawatson@gmail.com"}
  let!(:user_enter_password) {"emmawatson"}
  let!(:user_confirm_password) {"emmawatson"}
  let!(:user2) { FactoryGirl.create(:user, username: "username12345") }
  let!(:user3) { FactoryGirl.create(:user, email: "email12345@gmail.com") }
  let!(:existing_username) {"username12345"}
  let!(:existing_email) {"email12345@gmail.com"}
  let!(:bad_password) {"abc"}
  let!(:movie1) { FactoryGirl.create(:movie) }

  context "as prospective user" do
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
  end

  context "as prospective user who signs up" do
    scenario "user fills in sign-up form correctly and sees flash message confirming signup" do
      sign_up(user_first_name, user_last_name, user_username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("You have signed up successfully.")
    end

    scenario "user leaves first name blank and sees flash message with error" do
      sign_up(first_name, user_last_name, user_username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("First name can't be blank")
    end

    scenario "user leaves last name blank and sees flash message with error" do
      sign_up(user_first_name, last_name, user_username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("Last name can't be blank")
    end

    scenario "user leaves username blank and sees flash message with error" do
      sign_up(user_first_name, user_last_name, username, user_email, user_enter_password, user_confirm_password)

      expect(page).to have_content("Username can't be blank")
    end

    scenario "user leaves email blank and sees flash message with error" do
      sign_up(user_first_name, user_last_name, user_username, email, user_enter_password, user_confirm_password)

      expect(page).to have_content("Email can't be blank")
    end

    scenario "user leaves Enter Password field blank and sees flash message with error" do
      sign_up(user_first_name, user_last_name, user_username, user_email, enter_password, user_confirm_password)

      expect(page).to have_content("Password can't be blank")
    end

    scenario "user leaves Confirm Password field blank and sees flash message with error" do
      sign_up(user_first_name, user_last_name, user_username, user_email, user_enter_password, confirm_password)

      expect(page).to have_content("Password confirmation doesn't match")
    end

    scenario "user selects username that is taken and is prompted to choose another" do
      sign_up(user_first_name, user_last_name, existing_username, user_email, user_enter_password, confirm_password)

      expect(page).to have_content("Username has already been taken")
    end

    scenario "user inputs email that is already used and is prompted to choose another" do
      sign_up(user_first_name, user_last_name, user_username, existing_email, user_enter_password, confirm_password)

      expect(page).to have_content("Email has already been taken")
    end

    scenario "user inputs malformed password and is prompted to choose another" do
      sign_up(user_first_name, user_last_name, user_username, user_email, bad_password, bad_password)

      expect(page).to have_content(
        "Password is too short (minimum is 6 characters)"
      )
    end

    scenario "user attempts to navigate to movie show page/make a review"\
    " and is redirected to homepage with message to sign in" do
      visit "/movies"
      click_link movie1.title

      expect(page).to have_content("Please sign in or sign up in order to"\
      " view this movie and its reviews")
    end
  end
end
