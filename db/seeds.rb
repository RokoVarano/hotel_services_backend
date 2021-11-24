# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times { |n| User.create(name: "User#{n}") }

[ 'Pool time', 'Bedroom', 'Conference Room', 'Restaurant', 'Gym' ].map do |name|
  Service.create(
    name: name,
    description: "Best in class #{name} service, only at Hotels Hotels",
    price: 5000,
    image_url: 'https://picsum.photos/200/300'
  )
end

def create_reservation(user, service)
  Reservation.create(
    user_id: user.id,
    service_id: service.id,
    date: Date.tomorrow,
    city: ['Manila', 'Katmandu', 'Buenos Aires', 'Georgia', 'Cardiff'].sample
  )
end

User.all.map do |user|
  even_services = Service.all.select { |service| service.id.even? }
  odd_services = Service.all.select { |service| service.id.odd? }
  if user.id.even?
    even_services.map { |service| create_reservation(user, service) }
  else
    odd_services.map { |service| create_reservation(user, service) }
  end
end
