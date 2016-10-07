Add admin function to user (boolean)
Admin views user index
Admin deletes user
Admin deletes movie
Admin deletes review


require "rails_helper"

feature "admin" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user1.id) }
  let!(:review2) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user2.id) }

  before do
    user_sign_in(user1)
  end

  scenario "user is admin" do
    it "admin can view all users" do
      click_link "All Users"

      expect(page).to have_content(user1.username)
      expect(page).to have_content(user2.first_name)
      expect(page).to have_content(user3.last_name)
    end
  end

  scenario "user is not admin" do
    it "user cannot view all users" do

      expect(page).to_not have_content("All Users")
    end
  end

  scenario "user is admin" do
    it "and can delete a user" do
      click_link "All Users"
      click_button "delete 1"

      expect(page).to_not have_content(user1.username)
      expect(page).to have_content(user2.first_name)
      expect(page).to have_content(user3.last_name)
    end
  end

  scenario "user is admin" do
    it "and can delete a movie from index page" do
      click_button "delete 1"

      expect(page).to_not have_content(movie1.title)
      expect(page).to have_content(movie2.title)
    end
  end

  scenario "user is not admin" do
    it "and cannot delete a movie from index page" do

      expect(page).to_not have_content("delete 1")
    end
  end

  scenario "user is admin" do
    it "and can delete a movie from movie show page" do
      click_link movie1.title
      click_button "delete movie"

      expect(page).to_not have_content(movie1.title)
      expect(page).to have_content(movie2.title)
    end
  end

  scenario "user is not admin" do
    it "and cannot delete a movie from movie show page" do
      click_link movie1.title

      expect(page).to_not have_content("delete movie")
    end
  end

  scenario "user is admin" do
    it "and can delete a movie review from movie show page" do
      click_link movie1.title
      click_button "delete review 1"

      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(review1)
      expect(page).to have_content(review2)
    end
  end
end