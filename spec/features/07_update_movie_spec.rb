require "rails_helper"

feature "Edit Movie" do
  context "As an authenticated user admin" do
    before do
      user1 = User.create(
        first_name: "John",
        last_name: "Doe",
        username: "johndoe",
        email: "john@doe.com",
        password: "abcdef1",
        newsletter: true,
        admin: true
      )
      @movie1 = FactoryGirl.create(:movie)
      user_sign_in(user1)
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

    scenario "Unauthorized user attemps to edit movie" do
      normal_user = FactoryGirl.create(:user)
      click_link "Sign Out"
      user_sign_in(normal_user)
      visit edit_movie_path(@movie1)

      expect(page).to have_content("Access Denied.")
      expect(page).to_not have_content("Edit Movie")
    end
  end
end
