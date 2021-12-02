class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :date, presence: true
  validates :city, presence: true

  def as_json(_options = {})
    service = Service.find(service_id)

    {
      reservation_id: id,
      service_name: service.name,
      service_description: service.description,
      image_url: service.image_url,
      date: {
        day: date.day,
        month: date.month,
        year: date.year
      },
      city: city
    }
  end
end
