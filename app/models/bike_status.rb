class BikeStatus < ApplicationRecord
  has_many :bikes

  validates :description, presence: true, uniqueness: true
end
