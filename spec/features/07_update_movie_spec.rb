require "rails_helper"

feature "Edit Movie" do
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


    scenario "User sees a link Edit movie" do
      visit root_path
      click_link @movie1.title
      expect(page).to have_content("Edit")
    end

    scenario "User clicks link edit movie, and is redirected to"\
      " show page with updates " do
      visit root_path
      click_link @movie1.title
      click_link "Edit"
      expect(page).to have_content("Edit Movie")
      fill_in "Studio", with: "RKO Pictures"
      click_button "Submit"
      expect(page).to have_content("RKO Pictures")
      expect(page).to have_content("Movie Updated!")
    end

    scenario "User fails to edit movie, and form is rendered" do
      visit root_path
      click_link @movie1.title
      click_link "Edit"
      fill_in "Studio", with: ""
      click_button "Submit"
      expect(page).to have_content("Edit Movie")
      expect(page).to have_content("Movie Not Updated!")
      expect(page).to have_content("Studio can't be blank")
    end
  end
end
