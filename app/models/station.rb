class Station < ApplicationRecord
  has_many :bikes

  validates :capacity, presence: true
  validates :neighborhood, presence: true, uniqueness: true
end
