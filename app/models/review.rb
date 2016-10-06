class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :movie

  validates :title, presence: true
  validates :rating, numericality: { integer_only: true }
  validates :body, presence: true, length: { minimum: 50, message:
    "Body must be at least 50 characters" }

  validate :rating_range
  def rating_range
    unless (1..5).cover?(rating.to_i)
      errors.add(:rating_range, "Rating must be between 1 - 5")
    end
  end
end
