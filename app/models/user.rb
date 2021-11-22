class User < ApplicationRecord
  validates :name, presence: true, length: { in: 4..20 },
    uniqueness: true

  has_many :reservations, dependent: :destroy
  has_many :services, through: :reservations

  

  def user_exists?(user_name)
    User.exists?(name: user_name)
  end
end
