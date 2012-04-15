# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    is_admin false
    name "test"
    role "personal"
    id_no "12345678"
    birthday "1983-01-01".to_date
    company "test-company"
    capital 1000000
    industry_type "IT"
    website "http://example.com"
    title "manager"
    info "its my account"
    email "test@example.com"
    phone "0975519929"
  end
  factory :admin, class: User do
    is_admin true
    name "admin"
    role "personal"
    id_no "12345678"
    birthday "1983-01-01".to_date
    company "test-company"
    capital 1000000
    industry_type "IT"
    website "http://example.com"
    title "manager"
    info "its my account"
    email "test@example.com"
    phone "0975519929"
  end
  factory :company, class: User do
    is_admin false
    name "A company"
    role "company"
    id_no "12345678"
    birthday "1983-01-01".to_date
    company "test-company"
    capital 1000000
    industry_type "IT"
    website "http://example.com"
    title "manager"
    info "its my account"
    email "test@example.com"
    phone "0975519929"
  end
end
