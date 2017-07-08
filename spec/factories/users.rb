FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password_digest "password"
    first_name "Tester"
    last_name "Testing"
    city "City"
    state "State"
  end
end
