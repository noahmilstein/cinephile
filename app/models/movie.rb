class Movie < ActiveRecord::Base
  RATINGS = [
    ["-", ""],
    [1, "1"],
    [2, "2"],
    [3, "3"],
    [4, "4"],
    [5, "5"]
  ]
  def self.search(search)
    where("title LIKE ? OR studio LIKE ? OR year LIKE ? OR rating LIKE ? OR genre LIKE ? OR cast_member LIKE ? OR director LIKE ? OR screen_writer LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end

  validates :title, presence: true
  validates :studio, presence: true
  validates :year, presence: true
  validates :rating, presence: true
  validates :genre, presence: true
  validates :cast_member, presence: true
  validates :director, presence: true
  validates :screen_writer, presence: true

  has_many :reviews
  has_many :users, through: :reviews
end
