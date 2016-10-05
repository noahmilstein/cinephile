require "rails_helper"

feature "Authenticated user" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }

  before do
    user_sign_in(user)
  end

  scenario "See an index of movies" do
    visit movies_path

    expect(page).to have_content(movie1.title)
    expect(page).to have_link(movie2.title)
  end

  scenario "click on movie to review" do
    visit movie_path(movie1)

    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie1.studio)
    expect(page).to have_content(movie1.year)
    expect(page).to have_content(movie1.rating)
    expect(page).to have_content(movie1.genre)
    expect(page).to have_content(movie1.cast)
    expect(page).to have_content(movie1.director)
    expect(page).to have_content(movie1.screen_writer)
    expect(page).to have_content("Back to Index")
    click_link "Back to Index"
    expect(page).to have_content("Welcome to Cinephile!")
  end
end
