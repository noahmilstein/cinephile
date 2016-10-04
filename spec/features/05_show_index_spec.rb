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
    @movies2.each_with_index do |movie, i|
      expect(page).to have_content(@movies2[i - 1].title)
      expect(page).to have_link(@movies2[i - 1].title)
    end
  end

  scenario "click on movie to review" do
    @movies2[5..-1].each_with_index do |movie, q|
      click_link @movies2[q].title
      expect(page).to have_content(@movies2[q].title)
      expect(page).to have_content(@movies2[q].studio)
      expect(page).to have_content(@movies2[q].year)
      expect(page).to have_content(@movies2[q].rating)
      expect(page).to have_content(@movies2[q].genre)
      expect(page).to have_content(@movies2[q].cast)
      expect(page).to have_content(@movies2[q].director)
      expect(page).to have_content(@movies2[q].screen_writer)
      click_button "Back to Index"
    end
  end
end
