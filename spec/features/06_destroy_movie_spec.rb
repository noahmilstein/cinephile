require "rails_helper"

feature "Destroy Movie" do
  context "As an authenticated user" do
    before do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true
      )

      @movie1 = Movie.create(
      title: "Citizen Kane",
      studio: "Studio",
      year: 1940,
      rating: "R",
      genre: "drama",
      cast: "Cast Member 1, Cast Member 2",
      director: "Director 1",
      screen_writer: "Screen Writer 1"
      )

      user_sign_in(user1)
    end


    scenario "User sees a link Delete movie" do
      visit root_path
      click_link @movie1.title
      expect(page).to have_content("Delete")
    end

    scenario "User clicks link delete movie, and is redirected to"\
      " index page" do
      id = @movie1.id
      visit root_path
      click_link @movie1.title
      click_link "Delete"
      expect(page).to have_content("Movie Deleted!")
      expect(page).to have_content("Welcome to Cinephile!")
      expect { Movie.find(id) }.to raise_exception(ActiveRecord::RecordNotFound)
    end
  end
end
