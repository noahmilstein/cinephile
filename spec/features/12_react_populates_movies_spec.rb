require "rails_helper"

feature "React populates movies" do
  let!(:movie1) { FactoryGirl.create(:movie) }

  before do
    visit root_path
  end

  describe "User visits homepage" do
    it "sees new movies populate automatically", js: true do
      movie2 = FactoryGirl.create(:movie, title: "React Test")
      puts "Pausing for React AJAX call to poll server."
      sleep 3
      expect(page).to have_content(movie2.title)
    end
  end
end
