require "rails_helper"

feature "Unauthenticated user" do
  let!(:user) { FactoryGirl.create(:user, email: "emmawatson@gmail.com", password: "sixchar1") }
  let!(:incorrect_email) {"six"}
  let!(:incorrect_password) {"six"}
  let!(:movie) { FactoryGirl.create(:movie) }

  context "as an unauthenticated user" do
    scenario "click sign up link and see fields to complete form"\
    " registration" do
      visit "/"
      click_link("Sign In")
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
    end
  end

  context "as an authenticated user successfully signs in" do
    before do
      user_sign_in(user)
    end

    scenario "user fills in sign-in form correctly and is"\
    " redirected to the homepage" do
      expect(page).to have_content("Cinephile")
      expect(page).to have_current_path("/")
    end

    scenario "user fills in sign-in form correctly and sees flash "\
    "message confirming signin" do
      expect(page).to have_content("Signed in successfully.")
    end

    scenario "user fills in sign-in form correctly, sees flash message"\
    " confirming signin, and successfully clicks on a movie_link." do
      click_link(movie.title)

      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.studio)
      expect(page).to have_content(movie.year)
      expect(page).to have_content(movie.rating)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(movie.cast_member)
      expect(page).to have_content(movie.director)
      expect(page).to have_content(movie.screen_writer)
    end
  end

  context "as an authenticated user unsuccesfully signs in" do
    scenario "user fills in sign-in form incorrectly and sees flash"\
    " message with error" do
      email = "emmawatson@gmail.com"
      sign_in(email,incorrect_password)

      expect(page).to have_content("Invalid Email or password.")
    end

    scenario "user fills in sign-up form incorrectly and sees flash"\
    " message with error" do
      sign_in(incorrect_email,incorrect_password)

      expect(page).to have_content("Invalid Email or password.")
    end
  end
end
