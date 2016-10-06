require "rails_helper"

feature "Destroy Movie" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user1.id) }

  before do
    user_sign_in(user1)
  end

  scenario "User clicks link delete review, and is redirected to"\
    " movie show page" do
    visit root_path
    click_link movie1.title
    click_link "Delete Review"

    expect(page).to_not have_content(review1.title)
    expect(page).to_not have_content(review1.body)
    expect(page).to_not have_content(review1.rating)
    expect(page).to have_content("Review Deleted!")
  end

  scenario "Another user enters the site and goes to the movie"\
    " show page with the reviews and does not see the deleted review" do
    visit root_path
    click_link movie1.title
    click_link "Delete Review"
    click_link "Sign Out"
    user_sign_in(user2)
    click_link movie1.title

    expect(page).to_not have_content(review1.title)
    expect(page).to_not have_content(review1.body)
  end
end
