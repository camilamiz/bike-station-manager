class Station < ApplicationRecord
  has_many :bikes

  validates :capacity, presence: true
end
