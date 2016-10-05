require "rails_helper"

feature "Authenticated user" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }
  let!(:review) { FactoryGirl.create(:review) }

  before do
    user_sign_in(user)
  end

  scenario "user sees review form" do
    click_link movie1.title

    expect(page).to have_content("Write Review")
    expect(page).to have_content("Title here")
    expect(page).to have_content("Body here")
    expect(page).to have_selector(:link_or_button, "Rating")
    expect(page).to have_content("Submit Review")
  end

  scenario "user succesfully submits review form" do
    click_link movie1.title
    user_review(review)

    expect(page).to have_content(review.title)
    expect(page).to have_content(review.body)
    expect(page).to have_content(review.rating)
    expect(page).to have_content(movie1.title)
    expect(page).to_not have_content(movie2.title)
    expect(page).to have_content("Review Submitted!")
  end

  scenario "user unsuccessfully fills out review form" do
    click_link movie1.title
    click_button "Submit Review"

    expect(page).to have_content(movie1.title)
    expect(page).to_not have_content(movie2.title)
    expect(page).to have_content("Review failed to submit")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
    expect(page).to have_content("Rating can't be blank")
  end
end
