FactoryGirl.define do
  factory :team do
    name "Seattle"
    mascot "Seahawks"
    sub_sport
  end

  factory :home_team, parent: :team do
    name "Denver"
    mascot "Broncos"
    sub_sport
  end

  factory :away_team, parent: :team do
    name "Los Angeles"
    mascot "Rams"
    sub_sport
  end
end
