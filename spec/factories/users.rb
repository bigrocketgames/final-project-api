FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "password"
    first_name "Tester"
    last_name "Testing"
  end
end
