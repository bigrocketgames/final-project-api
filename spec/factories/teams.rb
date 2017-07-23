FactoryGirl.define do
  factory :team, aliases: [:home_team, :away_team] do
    name "Seattle"
    mascot "Seahawks"
    sport
  end
end
