# user profile displays their movies
# user profile displays their reviews
# user profile displays their reviews
# sign up and sign in link redundancies from devise removed
# add home page link to nav bar (movie index)

require "rails_helper"

feature "User profile" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie, user: user1) }
  let!(:movie2) { FactoryGirl.create(:movie, user: user2) }
  let!(:review1) { FactoryGirl.create(:review, movie: movie1, user: user1) }
  let!(:review2) { FactoryGirl.create(:review, movie: movie1, user: user2) }

  scenario "displays their movie submissions" do
    visit user_path(user1)

    expect(page).to have_content(movie1.title)
    expect(page).to have_link(movie1.title)
    expect(page).to_not have_content(movie2.title)
  end

  scenario "displays their review submissions" do
    visit user_path(user1)

    expect(page).to have_content(review1.title)
    expect(page).to have_link(review1.title)
    expect(page).to_not have_content(review2.title)
  end
end
