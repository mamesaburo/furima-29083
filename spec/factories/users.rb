FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {"1a2b3c"}
    password_confirmation {password}
    last_name {"山田"}
    first_name {"太郎"}
    last_name_kana {"カタカナ"}
    first_name_kana {"カタカナ"}
    birth {"2020-1-1"}
  end
end