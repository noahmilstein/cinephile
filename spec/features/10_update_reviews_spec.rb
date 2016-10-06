require "rails_helper"

feature "Edit Movie" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }
  let!(:review5) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user.id) }

  before do
    user_sign_in(user)
    visit movie_path(movie1)
  end

  scenario "User clicks link edit review, and is redirected to"\
    " review edit form " do
    click_link "Edit Review"

    expect(page).to have_content("Edit Review")
  end

  scenario "User successfully edits review" do
    visit edit_movie_review_path(movie1, review5)
    
    click_button "Submit"

    expect(page).to have_content(review5.body)
    expect(page).to have_content("Review successfully updated!")
  end

  scenario "User incorrectly fills out review form and"\
    " review form is re-renered with error message " do
    visit edit_movie_review_path(movie1, review5)
    fill_in "Review Title", with: ""
    fill_in "Review Body", with: ""

    click_button "Submit"

    expect(page).to have_content("Review was not updated.")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body must be at least 50 characters")
  end
end
