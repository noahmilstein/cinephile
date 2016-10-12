require "rails_helper"

feature "profile photo" do
  let(:user) { User.new(email: "email@website.com", username: "username", first_name: "firstname", last_name: "lastname", password: "password") }

  scenario "new user sees avatar upload option on sign up page" do
    visit root_path
    click_link "Sign Up"

    expect(page).to have_content("Add Avatar")
  end

  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: user.email
    fill_in "Username", with: user.username
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Enter Password", with: user.password
    fill_in "Confirm Password", with: user.password
    attach_file "Add Avatar", "#{Rails.root}/spec/support/images/twitter-egg-icon.jpg"
    click_button "Submit"
    click_link "My Profile"

    expect(page).to have_content(user.username)
    expect(page).to have_xpath("//img")
  end

  scenario "user edits a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "Email", with: user.email
    fill_in "Username", with: user.username
    fill_in "First Name", with: user.first_name
    fill_in "Last Name", with: user.last_name
    fill_in "Enter Password", with: user.password
    fill_in "Confirm Password", with: user.password
    attach_file "Add Avatar", "#{Rails.root}/spec/support/images/twitter-egg-icon.jpg"
    click_button "Submit"
    click_link "My Profile"
    click_link "Edit profile"

    attach_file "Edit Avatar", "#{Rails.root}/spec/support/images/homer.jpg"
    fill_in "Enter Password", with: user.password
    fill_in "Confirm Password", with: user.password
    fill_in "Current Password", with: user.password
    click_button "Update"
    click_link "My Profile"

    expect(page).to have_content(user.username)
    expect(page).to have_xpath("//img")
  end
end
