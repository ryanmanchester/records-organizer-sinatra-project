class Record < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: {message: "Please enter the name of the album"}
  validates :artist, presence: {message: "Please enter the name of the artist"}
end
