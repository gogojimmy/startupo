# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    user
    have_resource false
    find_resource false
    contact "Jimmy"
    phone "0975519929"
    email "test@example.com"
    description "A description for resource"
    state "public"
    to_public false
    resource_type
  end
end
