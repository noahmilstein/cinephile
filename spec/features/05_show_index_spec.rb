require "rails_helper"

feature "Authenticated user" do
  let!(:populate_db) do
    user1 = FactoryGirl.create(:user)
    @movies2 = FactoryGirl.create_list(:movie, 5)
  end

  describe "the signin process" do
    before :each do
      visit new_user_session_path
      fill_in "Email", with: user1.email
      fill_in "Password", with: user1.password
      click_button "Sign In"
      expect(page).to have_content("Welcome to Cinephile!")
    end
  end

  scenario "See an index of movies" do
    visit movies_path
    @movies2.each do |movie|
      expect(page).to have_content(movie.title)
      expect(page).to have_link(movie.title)
    end
  end

  scenario "click on movie to review" do
    @movies2[5..-1].each do |movie|
      click_link movie.title
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie.studio)
      expect(page).to have_content(movie.year)
      expect(page).to have_content(movie.rating)
      expect(page).to have_content(movie.genre)
      expect(page).to have_content(movie.cast)
      expect(page).to have_content(movie.director)
      expect(page).to have_content(movie.screen_writer)
      click_button "Back to Index"
    end
  end
end
