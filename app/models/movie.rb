class Movie < ActiveRecord::Base
  has_many :reviews
  
  validates :title, presence: true
  validates :studio, presence: true
  validates :year, presence: true
  validates :rating, presence: true
  validates :genre, presence: true
  validates :cast, presence: true
  validates :director, presence: true
  validates :screen_writer, presence: true
end
