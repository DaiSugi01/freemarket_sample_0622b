FactoryBot.define do
  factory :mst_status do
    name { Faker::Address.state }
  end
end
