FactoryBot.define do

  factory :user do
    last_name             {"太郎"}
    first_name             {"山田"}
    last_name_kana        {"たろう"}
    first_name_kana       {"やまだ"}
    nickname              {"yamachan"}
    email                 {"kkk@gmail.com"}
    password              {"a000000"}
    birthday              {"1994-04-01"}
    tel                   {"09012345678"}
    self_introduction     {"よろしく"}
    money                 {"10000"}
    point                 {"111111"}
    zip                   {"1111111"}
    prefecture            {"大阪府"}
    city_name             {"豊中市"}
    block_name            {"岡町1-1-1"}
    bill_name             {"柳ビル103"}
  end

end