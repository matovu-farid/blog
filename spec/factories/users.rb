FactoryBot.define do
  factory :user do
    name { "Farid" }
    photo { "MyString" }
    bio { "MyString" }
    sequence(:email) {|n| "farid#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    confirmed_at { DateTime.now }
    role { "user" }
    factory :admin do
      role { "admin" }
    end
  end
end
