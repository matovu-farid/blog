FactoryBot.define do
  factory :user do
    name { "MyString" }
    photo { "MyString" }
    bio { "MyString" }
    email { "MyString" }
    role { "user" }
    factory :admin do
      role { "admin" }
    end
  end
end
