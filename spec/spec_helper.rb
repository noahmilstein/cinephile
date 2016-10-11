require 'coveralls'

Coveralls.wear!('rails')

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before :each do
      ActionMailer::Base.deliveries.clear
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def user_sign_in(user)
  visit root_path
  click_link("Sign In")
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end

def user_sign_out(user)
  visit root_path
  click_link("Sign Out")
end

def user_review(review)
  fill_in "Review Title", with: review.title
  fill_in "Review Body", with: review.body
  select "4", from: "Rating"
  click_button "Submit Review"
end
