require "rails_helper"

feature "Prospective user" do
  context "as prospective user" do
    user1 = User.new(
      first_name: "John",
      last_name: "Doe",
      username: "johndoe",
      email: "john@doe.com",
      password: "sixchr1",
      newsletter: true
    )
    user2 = User.new(
      first_name: "Jane",
      last_name: "Doe",
      username: "janedoe",
      email: "jane@doe.com",
      password: "sixchr1",
      newsletter: true
    )
    movie1 = Movie.create(
      title: "Citizen Kane",
      studio: "Studio",
      year: 1940,
      rating: "R",
      genre: "drama",
      cast: "Cast Member 1, Cast Member 2",
      director: "Director 1",
      screen_writer: "Screen Writer 1"
    )

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

    scenario "user fills in sign-up form correctly and is redirected to the homepage" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Username", with: user1.username
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path("/")
    end

    scenario "user fills in sign-up form correctly and sees flash message confirming signup" do
      visit new_user_registration_path
      fill_in "First Name", with: user2.first_name
      fill_in "Last Name", with: user2.last_name
      fill_in "Username", with: user2.username
      fill_in "Email", with: user2.email
      fill_in "Enter Password", with: user2.password
      fill_in "Confirm Password", with: user2.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_content("You have signed up successfully.")
    end

    scenario "user leaves first name blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "Last Name", with: user1.last_name
      fill_in "Username", with: user1.username
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("First name can't be blank")
    end

    scenario "user leaves last name blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Username", with: user1.username
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Last name can't be blank")
    end

    scenario "user leaves username blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: user1.email
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Username can't be blank")
    end

    scenario "user leaves email blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Username", with: user1.username
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Email can't be blank")
    end

    scenario "user leaves Enter Password field blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: user1.email
      fill_in "Username", with: user1.username
      fill_in "Confirm Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Password can't be blank")
    end

    scenario "user leaves Confirm Password field blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: user1.email
      fill_in "Username", with: user1.username
      fill_in "Enter Password", with: user1.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Password confirmation doesn't match")
    end

    scenario "user leaves newsletter field blank and sees flash message with error" do
      visit new_user_registration_path
      fill_in "First Name", with: user1.first_name
      fill_in "Last Name", with: user1.last_name
      fill_in "Email", with: user1.email
      fill_in "Username", with: user1.username
      fill_in "Enter Password", with: user1.password
      fill_in "Confirm Password", with: user1.password
      click_button "Submit"
      expect(page).to have_current_path("/")
    end

    scenario "user selects username that is taken and is prompted to choose another" do
      user3 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "sixchr1",
        newsletter: true
      )
      visit new_user_registration_path
      fill_in "First Name", with: user2.first_name
      fill_in "Last Name", with: user2.last_name
      fill_in "Username", with: user3.username
      fill_in "Email", with: user2.email
      fill_in "Enter Password", with: user2.password
      fill_in "Confirm Password", with: user2.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Username has already been taken")
    end

    scenario "user inputs email that is already used and is prompted to choose another" do
      user3 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "sixchr1",
        newsletter: true
      )
      visit new_user_registration_path
      fill_in "First Name", with: user2.first_name
      fill_in "Last Name", with: user2.last_name
      fill_in "Username", with: user2.username
      fill_in "Email", with: user3.email
      fill_in "Enter Password", with: user2.password
      fill_in "Confirm Password", with: user2.password
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content("Email has already been taken")
    end

    scenario "user inputs malformed password and is prompted to choose another" do
      visit new_user_registration_path
      fill_in "First Name", with: user2.first_name
      fill_in "Last Name", with: user2.last_name
      fill_in "Username", with: user2.username
      fill_in "Email", with: user2.email
      fill_in "Enter Password", with: "abc"
      fill_in "Confirm Password", with: "abc"
      check "Sign up for newsletter?"
      click_button "Submit"
      expect(page).to have_current_path(users_path)
      expect(page).to have_content(
        "Password is too short (minimum is 6 characters)"
      )
    end

    scenario "user attempts to navigate to movie show page/make a review"\
      " and is redirected to homepage with message to sign in" do
      movie1 = Movie.create(
        title: "Citizen Kane",
        studio: "Studio",
        year: 1940,
        rating: "R",
        genre: "drama",
        cast: "Cast Member 1, Cast Member 2",
        director: "Director 1",
        screen_writer: "Screen Writer 1"
      )
      visit "/movies"
      click_link (movie1.title)
      expect(page).to have_current_path("/")
      expect(page).to have_content(
        "Please sign in or sign up in order to view this movie and its reviews"
      )
    end
  end
end
