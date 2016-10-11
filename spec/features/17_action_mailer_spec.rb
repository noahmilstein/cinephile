require "rails_helper"

feature "Action Mailer" do
  scenario "review a product, recieve email" do

    user = FactoryGirl.create(:user)
    movie = FactoryGirl.create(:movie)
    review = FactoryGirl.create(:review)

    user_sign_in(user)
    click_link(movie.title)
    user_review(review)

    expect(page).to have_content(movie.reviews.last.title)
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

end
