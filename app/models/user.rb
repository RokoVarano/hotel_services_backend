class User < ApplicationRecord
  validates :name, presence: true, length: { in: 3..50 }, uniqueness: true

  has_many :reservations, dependent: :destroy
  has_many :services, through: :reservations
end
