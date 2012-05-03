# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin_category do
    sequence(:name) { |n| "name#{n}" }
    sequence(:description) { |n| "description#{n}" }
  end
end
