FactoryBot.define do

  factory :tbl_product do
    name                  {Faker::Team.name}
    description           {"テスト"}
    price                 {100}
    mst_major_category
    mst_brand
    mst_size
    mst_condition
    mst_burden
    mst_delivery_method
    mst_prefecture
    mst_delivery_time
    mst_status
    tbl_user
  end

end