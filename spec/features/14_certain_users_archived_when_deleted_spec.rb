require "rails_helper"

feature "archive users" do
  let!(:admin) { FactoryGirl.create(:user, admin: true) }
  let!(:user1) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:user3) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie, user: user1) }
  let!(:movie2) { FactoryGirl.create(:movie, user: user2) }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user1.id) }
  let!(:review2) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user2.id) }

  scenario "user is admin and archives a user who has created a movie" do
    user_sign_in(admin)
    click_link "All Users"
    click_link "delete 1"

    expect(page).to_not have_content(user1.username)
    expect(page).to have_content("_deleted_at_")
    expect(page).to have_content(user2.first_name)
    expect(page).to have_content(user3.last_name)
  end

  describe "user is not admin and has created a movie" do
    it "archives the user when the user self-deletes" do
      user_sign_in(user1)
      click_link "My Profile"
      click_link "Edit Profile"
      click_button "Cancel my account"

      byestring = "Bye! Your account has been successfully cancelled."\
      " We hope to see you again soon."
      expect(page).to have_content(byestring)
      expect(page).to have_current_path("/")
      archived_user = User.find(user1.id)
      expect(archived_user.id).to eq(user1.id)
      expect(archived_user.first_name).to_not eq(user1.first_name)
      expect(archived_user.last_name).to_not eq(user1.last_name)
      expect(archived_user.email).to_not eq(user1.email)
      expect(archived_user.username).to_not eq(user1.username)
    end
  end
end
