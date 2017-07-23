FactoryGirl.define do
  factory :team do
    name "Seattle"
    mascot "Seahawks"
    sport
  end

  factory :home_team, parent: :team do
    name "Denver"
    mascot "Broncos"
    sport_id 1
  end

  factory :away_team, parent: :team do
    name "Los Angeles"
    mascot "Rams"
    sport_id 1
  end
end
