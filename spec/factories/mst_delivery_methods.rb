FactoryBot.define do
  factory :mst_delivery_method do
    name { Faker::Address.state }
  end
end
