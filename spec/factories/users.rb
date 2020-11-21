FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"123abc"}
    password_confirmation {password}
    last_name             {"test"}
    first_name            {"test"}
    last_name_kana        {"test"}
    first_name_kana       {"test"}
    birth                 {"2020-01-01"}
  end
end