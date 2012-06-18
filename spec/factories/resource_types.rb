# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource_type do
    sequence(:name) { |n| "Type #{n}" }
    sequence(:description) { |n| "Type #{n}'s description'" }
  end
end
