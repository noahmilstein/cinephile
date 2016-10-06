require "rails_helper"

feature "User reads reviews" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie, title: "Test asdfdasf title") }
  let!(:movie2) { FactoryGirl.create(:movie, title: "Test fdghdfghgdfh title") }
  let!(:review1) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user.id) }
  let!(:review2) { FactoryGirl.create(:review, movie_id: movie1.id, user_id: user.id) }
  let!(:review3) { FactoryGirl.create(:review, movie_id: movie2.id, user_id: user.id) }
  let!(:review4) { FactoryGirl.create(:review, movie_id: movie2.id, user_id: user.id) }

  before do
    user_sign_in(user)
    visit movies_path
  end

  scenario "Do not see reviews on index page" do
    expect(page).to_not have_content(review1.title)
    expect(page).to_not have_content(review1.body)
    expect(page).to_not have_content(review1.rating)
    expect(page).to_not have_content(review2.title)
    expect(page).to_not have_content(review2.body)
    expect(page).to_not have_content(review2.rating)
  end

  scenario "See a list of reviews on movie 1 show page" do
    click_on movie1.title

    expect(page).to have_content(review1.title)
    expect(page).to have_content(review1.body)
    expect(page).to have_content(review2.title)
    expect(page).to have_content(review2.body)
  end

  scenario "See a list of reviews on movie 2 show page" do
    click_on movie2.title

    expect(page).to have_content(review3.title)
    expect(page).to have_content(review3.body)
    expect(page).to have_content(review4.title)
    expect(page).to have_content(review4.body)
  end
end
