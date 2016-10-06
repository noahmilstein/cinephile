require "rails_helper"

feature "Edit Movie" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user.id) }

  before do
    user_sign_in(user)
  end

  scenario "User clicks link edit review, and is redirected to"\
    " review edit form " do
    visit root_path
    click_link movie1.title

    click_link "Edit Review"
    expect(page).to have_content("Edit Review")
    fill_in "Title", with:
      "This new body is 50 characters long at least I think"
    click_button "Submit"
    expect(page).to have_content(
      "This new body is 50 characters long at least I think"
    )
    expect(page).to have_content("Review successfully updated!")
  end

  scenario "User incorrectly fills out review form and"\
    " review form is re-renered with error message " do
    visit root_path
    click_link movie1.title
    click_link "Edit Review"
    expect(page).to have_content("Edit Review")
    fill_in "Review Title", with: ""
    fill_in "Review Body", with: ""
    click_button "Submit"
    expect(page).to have_content("Review was not updated.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body is too short (minimum is 50 characters)")
  end
end
