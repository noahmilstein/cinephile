FactoryGirl.define do
  factory :review do
    sequence(:title) { |n| "#{n}title" }
    sequence(:body) { |n| "#{n} This is a long body description,"\
    "at least 50 characters long"  }
    rating "4"
    movie
    user
  end
end
