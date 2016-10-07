require "rails_helper"

feature "Destroy Movie" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user1.id) }

  before do
    user_sign_in(user1)
    visit movie_path(movie1)
  end

  describe "User clicks link delete review" do
    it "redirects to movie show page" do
      click_link "Delete Review"

      expect(page).to_not have_content(review1.title.to_s + " " +
        review1.body.to_s + " " + review1.rating.to_s)
      expect(page).to have_content("Review Deleted!")
    end
  end
end
