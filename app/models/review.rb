class Review < ActiveRecord::Base
  validates :title, presence: true
  validates :rating, numericality: { integer_only: true }, inclusion: { in: 1..5, message: "Rating must be 1 - 5" }
  validates :body, presence: true, length: { minimum: 50, message: "Body must be at least 50 characters" }

  belongs_to :movie
  belongs_to :user
end
