# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resource do
    user_id 1
    have_resource false
    find_resource false
    contact "MyString"
    phone "MyString"
    email "MyString"
    description "MyText"
    state "MyString"
    to_public false
  end
end
