FactoryBot.define do
  factory :mst_delivery_time do
    name { Faker::Address.state }
  end
end
