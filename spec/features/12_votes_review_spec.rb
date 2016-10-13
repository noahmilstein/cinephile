require "rails_helper"

feature "User votes on reviews" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie: movie1, user: user1) }
  let!(:review2) { FactoryGirl.create(:review, movie: movie1, user: user2) }

  describe "User votes on a review" do
    before do
      user_sign_in(user1)
      visit movie_path(movie1)
    end

    scenario "user upvotes on the first review" do
      click_button("Upvote_2")

      expect(review2.votes[0].upvote).to eq(1)
      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.body)
      expect(page).to have_content(review2.rating)
    end

    scenario "user downvotes on the second review with 0 votes" do
      click_button("Downvote_2")

      expect(review2.votes[0].downvote).to eq(1)
      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.body)
      expect(page).to have_content(review2.rating)
    end
  end

  describe "User upvotes on the same review" do
    before do
      user_sign_in(user1)
      visit movie_path(movie1)
    end

    scenario "toggle upvote back to zero" do
      2.times do
        click_button("Upvote_2")
      end

      expect(review2.votes[0].upvote).to eq(0)
    end

    scenario "toggle downvote back to zero" do
      2.times do
        click_button("Downvote_2")
      end

      expect(review2.votes[0].downvote).to eq(0)
    end
  end

  describe "User2 votes on a review" do
    before do
      user_sign_in(user2)
      visit movie_path(movie1)
      review1.votes.create(user: user1, review: review1, upvote: 1, downvote: 0)
    end

    scenario "user2 upvotes on the first review" do
      click_button("Upvote_1")

      expect(review1.votes.count).to eq(2)
      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.body)
      expect(page).to have_content(review1.rating)
    end
  end

  describe "User votes on user's review" do
    before do
      user_sign_in(user2)
      visit movie_path(movie1)
    end

    scenario "user2 upvotes on the user2's review" do
      click_button("Upvote_2")

      expect(review2.votes.count).to eq(0)
      expect(page).to have_content(review2.title)
      expect(page).to have_content(review2.body)
      expect(page).to have_content(review2.rating)
    end
  end
end
