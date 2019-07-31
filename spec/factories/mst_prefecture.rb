FactoryBot.define do

  factory :mst_prefecture do
    # sequence(:id) { |n| n }
    name { Faker::Address.state }
  end

end