FactoryBot.define do
  factory :mst_burden do
    name { Faker::Address.state }
  end
end
