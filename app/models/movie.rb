class Movie < ActiveRecord::Base
  validates :title, presence: true
  validates :studio, presence: true
  validates :year, presence: true
  validates :rating, presence: true
  validates :genre, presence: true
  validates :cast, presence: true
  validates :director, presence: true
  validates :screen_writer, presence: true
end
