FactoryBot.define do

  factory :tbl_address do
    full_name         {"山田太郎"}
    full_name_kana    {"ヤマダタロウ"}
    zip               {1350012}
    mst_prefecture_id {1}
    address           {"札幌市北区1-1"}
    phone             {"08098762345"}
    tbl_user
  end

end