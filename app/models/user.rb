class User < ApplicationRecord
    has_many :trips

    validates :document_number, presence: true, uniqueness: true
end
