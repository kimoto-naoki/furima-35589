FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    shipping_area_id {Faker::Number.between(from: 2, to: 48)}
    city { '東京都' }
    house_number { '1-2-3' }
    building {'なんばスカイオ'}
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
