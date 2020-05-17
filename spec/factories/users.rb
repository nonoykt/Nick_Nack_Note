FactoryBot.define do
  factory :user do
    sequence(:username) { |n| 'testuser#{n}' }
    sequence(:email) { |n| 'test#{n}@example.com' }
    password { 'password' }
  end
end
