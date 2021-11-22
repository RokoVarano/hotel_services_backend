class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :date, presence: true
  validates :city, presence: true

  def as_json(_options = {})
    {
      id: id,
      user_id: user_id,
      service_id: service_id,
      date: date,
      city: city
    }
  end
end
