class Movie < ActiveRecord::Base

  RATINGS = [
    [1, ""],
    [2, "1"],
    [3, "2"],
    [4, "3"],
    [5, "4"],
    [6, "5"]
  ]

  validates :title, presence: true
  validates :studio, presence: true
  validates :year, presence: true
  validates :rating, presence: true
  validates :genre, presence: true
  validates :cast, presence: true
  validates :director, presence: true
  validates :screen_writer, presence: true

  has_many :reviews
  has_many :users, through: :reviews
end
