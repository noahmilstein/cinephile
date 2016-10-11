require "rails_helper"

feature "admin" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie, title: "Harry Potter 1") }

  describe "User searches for a movie" do
    before do
      user_sign_in(user1)
    end

    scenario "user searches for movie1" do
      fill_in "Search", with: movie1.title
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's studio" do
      fill_in "Search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's year" do
      fill_in "Search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's rating" do
      fill_in "Search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's genre" do
      fill_in "Search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's cast" do
      fill_in "Search", with: movie1.cast_member
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's director" do
      fill_in "Search", with: movie1.director
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end

    scenario "user searches for movie1's screen_writer" do
      fill_in "Search", with: movie1.screen_writer
      click_button("Search")

      expect(page).to have_content("Serach Results: 1")
      expect(page).to have_content(movie1.title)
    end
  end

end
