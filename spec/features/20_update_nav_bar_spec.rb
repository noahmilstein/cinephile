require "rails_helper"

feature "user" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "sign up & sign in options only in nav bar on registration page" do
    visit new_user_registration_path

    expect(page).to_not have_content("Sign me up")
    expect(page).to_not have_content("Log in")
  end

  scenario "sign up & sign in options only in nav bar on sign in page" do
    visit new_user_session_path

    expect(page).to_not have_content("Sign me up")
    expect(page).to_not have_content("Log in")
  end

  scenario "nav bar has home page linked to movie index path" do
    user_sign_in(user)

    expect(page).to have_content("Home")
  end
end
