FactoryBot.define do
  factory :user do
    name { 'User 1' }
  end

  factory :service do
    name { 'Test service' }
    description { 'Spend the day enjoying our service' }
    price { 1000 }
    image_url { 'https://picsum.photos/200/300' }
  end

  factory :reservation do
    user_id { 1 }
    service_id { 1 }
    city { 'Manila' }
    date { Date.tomorrow }
  end
end
