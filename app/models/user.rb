class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20 }

  has_many :reservations
end
