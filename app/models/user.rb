class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20,
    invalid_length: "%{count} should be between 4 and 20 characters" }

    has_many :reservations
end
