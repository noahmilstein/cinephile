# sign up and sign in link redundancies from devise removed
# add home page link to nav bar (movie index)

require "rails_helper"

feature "admin" do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user1.id) }
  let!(:review2) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user2.id) }

  scenario "" do
  end
end
