FactoryBot.define do
  factory :purchasestreet_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '京都市' }
    address { '青山1-1-1' }
    appointment_name_name { '東京ハイツ' }
    phone_number { '08011119999' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end