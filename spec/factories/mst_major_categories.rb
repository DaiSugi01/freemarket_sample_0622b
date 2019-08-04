FactoryBot.define do
  factory :mst_major_category do
    name { Faker::Address.state }
  end
end
