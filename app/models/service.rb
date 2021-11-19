class Service < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :duration, presence: true
  validates :price, presence: true
  validates :city, presence: true
  validates :image_url, presence: true, format: URI::regexp(%w[http https])
end
