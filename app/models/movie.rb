class Movie < ActiveRecord::Base
  RATINGS = [
    ["-", ""],
    [1, "1"],
    [2, "2"],
    [3, "3"],
    [4, "4"],
    [5, "5"]
  ]

  validates :user, presence: true
  validates :title, presence: true
  validates :studio, presence: true
  validates :year, numericality: { integer_only: true }, presence: true
  validates :rating, presence: true
  validates :genre, presence: true
  validates :cast, presence: true
  validates :director, presence: true
  validates :screen_writer, presence: true

  has_many :reviews
  has_many :users, through: :reviews
  belongs_to :user
end
