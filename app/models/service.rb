class Service < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 250 }
  validates :price, presence: true
  validates :image_url, presence: true, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  has_many :reservations
  has_many :users, through: :reservations

  def as_json(options={})
    {
      id: id,
      name: name,
      description: description,
      price: price,
      image_url: image_url
    }
  end
end
