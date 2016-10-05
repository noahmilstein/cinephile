FactoryGirl.define do
  factory :review do
    sequence(:title) { |n| "#{n}title" }
    sequence(:body) { |n| "#{n}studio" }
    rating 4
  end
end
