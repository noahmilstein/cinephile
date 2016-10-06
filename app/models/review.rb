class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true
  validates :body, presence: true
  validates_length_of :body, minimum: 50
  validates :rating, numericality: { only_integer: true }, inclusion: {in: 1..5, message: " must be between 1 - 5" }, presence: true
end
