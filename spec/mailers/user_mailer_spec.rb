require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "notice" do
    let!(:user) { FactoryGirl.create(:user, username: "sdfgsdfgsdfgdfg", email: "sfdgsfdsfdsf@asdas.com") }
    let!(:user100) { FactoryGirl.create(:user, username: "ascaw", email: "oiqwe@ca.com") }
    let!(:movie) { FactoryGirl.create(:movie, user: user) }
    let!(:review) { FactoryGirl.create(:review, user: user100) }
    let(:mail) { UserMailer.notice(review) }

    it "renders the headers" do
      expect(mail.subject).to eq("New review posted for #{review.movie.title}")
      expect(mail.to).to eq(["#{review.movie.user.email}"])
      expect(mail.from).to eq(["cinephile.launch@gmail.com"])
    end
  end
end
