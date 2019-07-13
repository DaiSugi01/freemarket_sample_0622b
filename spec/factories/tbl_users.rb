FactoryBot.define do

  factory :tbl_user do
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"ユウキ"}
    birthday              {"1995-01-01"}
    phone                 {"08098762345"}
  end

end