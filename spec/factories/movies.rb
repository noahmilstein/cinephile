require 'factory_girl'

FactoryGirl.define do
  factory :movie do
    sequence(:title) { |n| "#{n}title" }
    sequence(:studio) { |n| "#{n}studio" }
    sequence(:year) { |n| n * 1000 }
    sequence(:rating) { |n| "#{n}" }
    sequence(:genre) { |n| "#{n}genre" }
    sequence(:cast) { |n| "#{n}cast" }
    sequence(:director) { |n| "#{n}director" }
    sequence(:screen_writer) { |n| "#{n}screen_writer" }
  end
end
