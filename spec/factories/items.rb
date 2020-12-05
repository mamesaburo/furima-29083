FactoryBot.define do
  factory :item do
    name {"ワンピース"}
    description {"今季の商品です"}
    category_id {"1"}
    condition_id {"1"}
    shipping_cost_id {"1"}
    shipping_area_id {"1"}
    shipping_days_id {"1"}
    price {"10000"}
    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
