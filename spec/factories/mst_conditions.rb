FactoryBot.define do
  factory :mst_condition do
    name { Faker::Address.state }
  end
end
