# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id_no "A127421684"
    password "123456"
    birthday { 21.years.ago }
    sequence(:name) { |n| "test#{n}" }
    sequence(:company) { |n| "Example Company#{n}" }
    title "RD"
    mobile "0975519929"
    sequence(:email) { |n| "example#{n}@example.com" }

    trait :admin do
      is_admin true
    end

    factory :admin, :traits => [:admin]
  end
end
