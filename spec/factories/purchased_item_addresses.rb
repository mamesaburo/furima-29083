FactoryBot.define do
  factory :purchased_item_address do
    postal_code {"123-4567"}
    shipping_area_id {"1"}
    city {"横浜市緑区"}
    address_detail {"青山1-1-1"}
    building {"ハイツ103"}
    phone_number {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {"1"}
    item_id {"1"}
  end
end