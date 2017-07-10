FactoryGirl.define do
  factory :message do
    content "MyText"
    user
    chatRoom
  end
end
