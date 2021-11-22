class Reservation < ApplicationRecord
  belongs_to :user

  validates :date, presence: true
  validates :city, presence: true

  def as_json(options={})
    {
      id: id,
      user_id: user_id,
      service_id: service_id,
      date: date,
      city: city
    }
  end
end
