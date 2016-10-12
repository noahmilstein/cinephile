require "rails_helper"

feature "admin" do
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie, title: "Harry Potter 1") }
  let!(:movie2) { FactoryGirl.create(:movie, title: "Harry Potter 2", studio: "studio", year: "2002", rating: "R", genre: "xgenre", cast_member: "xcast", director: "xdirector", screen_writer: "xscreen writer" ) }

  describe "User searches for a movie" do
    before do
      user_sign_in(user1)
    end

    scenario "user searches for movie1" do
      fill_in "search", with: movie1.title
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's studio" do
      fill_in "search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's year" do
      fill_in "search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's rating" do
      fill_in "search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's genre" do
      fill_in "search", with: movie1.studio
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's cast" do
      fill_in "search", with: movie1.cast_member
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's director" do
      fill_in "search", with: movie1.director
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches for movie1's screen_writer" do
      fill_in "search", with: movie1.screen_writer
      click_button("Search")

      expect(page).to have_content("Search Results: 1")
      expect(page).to have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user does not get a matching search" do
      fill_in "search", with: "Nomatch"
      click_button("Search")

      expect(page).to have_content("Search Results: 0")
      expect(page).to have_content("There are no movies containing the term Nomatch.")
      expect(page).to_not have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end

    scenario "user searches blank " do
      click_button("Search")

      expect(page).to have_content("Search Results: 0")
      expect(page).to have_content("There are no movies containing the term  .")
      expect(page).to_not have_content(movie1.title)
      expect(page).to_not have_content(movie2.title)
    end
  end

end
