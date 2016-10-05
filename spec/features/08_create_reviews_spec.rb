require "rails_helper"

feature "Authenticated user" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:movie1) { FactoryGirl.create(:movie) }
  let!(:movie2) { FactoryGirl.create(:movie) }

  before do
    user_sign_in(user)
  end

end
