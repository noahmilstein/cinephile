FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "#{n}movietitle" }
    sequence(:studio) { |n| "#{n}studio" }
    sequence(:year) { |n| "#{n}1000" }
    sequence(:rating) { |n| "#{n}" }
    sequence(:genre) { |n| "#{n}genre" }
    sequence(:cast_member) { |n| "#{n}cast" }
    sequence(:director) { |n| "#{n}director" }
    sequence(:screen_writer) { |n| "#{n}screen_writer" }
    user
  end
end
