FactoryBot.define do
  factory :item do
    association :user
    name               { '名前' }
    description        { '説明' }
    category_id        { '2' }
    status_id          { '2' }
    delivery_fee_id    { '2' }
    delivery_area_id   { '2' }
    delivery_days_id   { '2' }
    price              { '1000' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
