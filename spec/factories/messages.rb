FactoryGirl.define do
  factory :message do
    content "MyText"
    user
    chat_room
  end
end
