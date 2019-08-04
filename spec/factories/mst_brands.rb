FactoryBot.define do
  factory :mst_brand do
    name { Faker::Address.state }
  end
end
